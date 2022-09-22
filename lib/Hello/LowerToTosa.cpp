#include "mlir/IR/BuiltinDialect.h"
#include "Hello/HelloDialect.h"
#include "Hello/HelloOps.h"
#include "Hello/HelloPasses.h"

#include "mlir/Dialect/Tosa/IR/TosaOps.h"
#include "mlir/Dialect/Tosa/Utils/ShapeUtils.h"
#include "../thirdparty/llvm-project/mlir/lib/Dialect/Tosa/Transforms/TosaInferShapes.cpp"
#include "mlir/Dialect/Tosa/Transforms/Passes.h"

#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"
#include "llvm/ADT/Sequence.h"

using namespace mlir;


struct ConstantOpLowering : public mlir::ConversionPattern {
  ConstantOpLowering(mlir::MLIRContext *ctx)
      : mlir::ConversionPattern("hello.constant", 1, ctx) {}

  mlir::LogicalResult
  matchAndRewrite(mlir::Operation *op, ArrayRef<mlir::Value> operands,
                  mlir::ConversionPatternRewriter &rewriter) const final {
 
  hello::ConstantOp constant_op = llvm::dyn_cast<hello::ConstantOp>(op);// %0 = "hello.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>} : () -> tensor<2x3xf64>

  ShapedType output_type =constant_op.getResult().getType().dyn_cast<ShapedType>(); //output_type =  tensor<2x3xf64>
  if(!output_type) return failure();

  ElementsAttr elements = ElementsAttr(constant_op.value());
  Type element_type = elements.getType().getElementType(); 
  if (!output_type.hasRank()) {
   output_type = elements.getType().cast<ShapedType>().clone(element_type);
  }
  rewriter.replaceOpWithNewOp<tosa::ConstOp>(op, output_type, elements);
  return success();

  }
};
template <typename TosaOp, typename... Args>
TosaOp CreateOpAndInfer(PatternRewriter &rewriter, Location loc, Type resultTy,
                         Args &&...args) {
   auto op = rewriter.create<TosaOp>(loc, resultTy, args...);
 
   InferShapedTypeOpInterface shapeInterface =
       dyn_cast<InferShapedTypeOpInterface>(op.getOperation());
   if (!shapeInterface)
     return op;
 
   SmallVector<ShapedTypeComponents> returnedShapes;
   if (shapeInterface
           .inferReturnTypeComponents(op.getContext(), op.getLoc(),
                                      op->getOperands(), op->getAttrDictionary(),
                                      op->getRegions(), returnedShapes)
           .failed())
     return op;
 
   // We need to use the element type of the existing result type to generate
   // the new result shaped type. This is because rescale can include a cast to
   // different bit-width types and does not have a TypeAttr to define the
   // target type.
   auto result = op->getResult(0);
   auto predictedShape = returnedShapes[0];
   auto currentKnowledge =
       mlir::tosa::ValueKnowledge::getKnowledgeFromType(resultTy);
 
   // Compute the knowledge based on the inferred type.
   auto inferredKnowledge =
       mlir::tosa::ValueKnowledge::getPessimisticValueState();
   inferredKnowledge.dtype = resultTy.cast<ShapedType>().getElementType();
   inferredKnowledge.hasRank = predictedShape.hasRank();
   if (predictedShape.hasRank()) {
     for (auto dim : predictedShape.getDims()) {
       inferredKnowledge.sizes.push_back(dim);
     }
   }
 
   // Compute the new type based on the joined version.
   auto newKnowledge =
       mlir::tosa::ValueKnowledge::join(currentKnowledge, inferredKnowledge);
   auto newTy = newKnowledge.getType();
   result.setType(newTy);
   return op;
 }

 struct AddOpLowering : public mlir::ConversionPattern {
  AddOpLowering(mlir::MLIRContext *ctx)
      : mlir::ConversionPattern("hello.Add", 1, ctx) {}

  mlir::LogicalResult
  matchAndRewrite(mlir::Operation *op, ArrayRef<mlir::Value> operands,
                  mlir::ConversionPatternRewriter &rewriter) const final {
 
  hello::AddOp add_op = llvm::dyn_cast<hello::AddOp>(op); 
  //add_op = %6 = "hello.Add"(%3, %5) : (tensor<2x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
  ShapedType output_type = add_op.getResult().getType().dyn_cast<ShapedType>(); //output_type = (tensor<2x3xf32>
     
  if (!output_type) return failure();  
  SmallVector<Value> inputs(add_op.getOperands()); 
  // inputs[0] =>   %3 = "hello.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>} : () -> tensor<2x3xf32>
  // inputs[1] =>   %5 = "hello.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>} : () -> tensor<2x3xf32>
    
  auto newOp = CreateOpAndInfer<tosa::AddOp>(rewriter, op->getLoc(),
                                             output_type, inputs[0], inputs[1]);
  // newOp =>   %6 = "tosa.add"(%3, %5) : (tensor<2x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
                                            
  rewriter.replaceOp(op, {newOp.getResult()});

  return success();

  }
};

namespace {
class HelloToTosaLowerPass : public mlir::PassWrapper<HelloToTosaLowerPass, mlir::OperationPass<mlir::ModuleOp>> {
public:
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(HelloToTosaLowerPass)

  void getDependentDialects(mlir::DialectRegistry &registry) const override {
      registry.insert<mlir::tosa::TosaDialect, mlir::func::FuncDialect>();
  }

  void runOnOperation() final;
};
}

void HelloToTosaLowerPass::runOnOperation() {
  mlir::ConversionTarget target(getContext());

  target.addIllegalDialect<hello::HelloDialect>();
  target.addLegalDialect<mlir::tosa::TosaDialect,mlir::func::FuncDialect>();
  target.addLegalOp<hello::PrintOp>();
  
  mlir::RewritePatternSet patterns(&getContext());
  patterns.add<ConstantOpLowering,AddOpLowering>(patterns.getContext());
  

  if (mlir::failed(mlir::applyPartialConversion(getOperation(), target, std::move(patterns)))) {
    signalPassFailure();
  }
}
std::unique_ptr<mlir::Pass> hello::createLowerToTosaPass() {
  return std::make_unique<HelloToTosaLowerPass>();
}
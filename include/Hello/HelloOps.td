#ifndef HELLO_OPS
#define HELLO_OPS

include "mlir/IR/OpBase.td"
include "HelloDialect.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def F32ElementsAttr : FloatElementsAttr<32>;

def ConstantOp : Hello_Op<"constant", [NoSideEffect]> {
  let summary = "constant";
  let description = [{
    Constant operation turns a literal into an SSA value. The data is attached
    to the operation as an attribute. For example:

    ```mlir
      %0 = "hello.constant"()
      { value = dense<[[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]> : tensor<2x3xf64> }
      : () -> tensor<2x3xf64>
    ```
  }];

  let builders = [
    OpBuilder<(ins "mlir::DenseElementsAttr":$value), [{
      build($_builder, $_state, value.getType(), value);
    }]>,
    OpBuilder<(ins "float":$value)>
  ];

//  let parser = [{ return ::parseConstantOp(parser, result); }];
  let arguments = (ins F32ElementsAttr:$value);
  let results = (outs F32Tensor);
}

def AddOp : Hello_Op<"Add", [NoSideEffect]>{
   let summary = "add operation";
    let description = [{
        The "add" builtin operation takes 2 inputs and add it and generate the result.
    }];

    let arguments = (ins F32Tensor:$lhs, F32Tensor:$rhs);
    let results = (outs F32Tensor);

     let builders = [
    OpBuilder<(ins "mlir::Value":$lhs, "mlir::Value":$rhs)>
  ];
}

def PrintOp : Hello_Op<"print", [NoSideEffect]> {
    let summary = "print operation";
    let description = [{
        The "print" builtin operation prints a given input tensor, and produces
        no results.
    }];

    // The print operation takes an input tensor to print.
    let arguments = (ins AnyTypeOf<[F32Tensor, F32MemRef]>:$input);

    let assemblyFormat = "$input attr-dict `:` type($input)";
}

#endif // HELLO_OPS
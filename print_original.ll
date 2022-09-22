; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@nl = internal constant [2 x i8] c"\0A\00"
@frmt_spec = internal constant [4 x i8] c"%f \00"

declare ptr @malloc(i64)

declare void @free(ptr)

declare i32 @printf(ptr, ...)

define void @main() !dbg !3 {
  %1 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (double, ptr null, i64 6) to i64)), !dbg !7
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 2, 3, 0, !dbg !7
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 3, 1, !dbg !7
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 4, 0, !dbg !7
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1, !dbg !7
  %9 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (double, ptr null, i64 6) to i64)), !dbg !9
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0, !dbg !9
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1, !dbg !9
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2, !dbg !9
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 2, 3, 0, !dbg !9
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 3, 3, 1, !dbg !9
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 4, 0, !dbg !9
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1, !dbg !9
  %17 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (double, ptr null, i64 6) to i64)), !dbg !10
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %17, 0, !dbg !10
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %17, 1, !dbg !10
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2, !dbg !10
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 2, 3, 0, !dbg !10
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 3, 3, 1, !dbg !10
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 3, 4, 0, !dbg !10
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1, !dbg !10
  %25 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (double, ptr null, i64 6) to i64)), !dbg !11
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %25, 0, !dbg !11
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, ptr %25, 1, !dbg !11
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 0, 2, !dbg !11
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 2, 3, 0, !dbg !11
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 3, 3, 1, !dbg !11
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 3, 4, 0, !dbg !11
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 1, 4, 1, !dbg !11
  %33 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, 1, !dbg !11
  %34 = getelementptr double, ptr %33, i64 0, !dbg !11
  store double 1.000000e+00, ptr %34, align 8, !dbg !11
  %35 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, 1, !dbg !11
  %36 = getelementptr double, ptr %35, i64 1, !dbg !11
  store double 2.000000e+00, ptr %36, align 8, !dbg !11
  %37 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, 1, !dbg !11
  %38 = getelementptr double, ptr %37, i64 2, !dbg !11
  store double 3.000000e+00, ptr %38, align 8, !dbg !11
  %39 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, 1, !dbg !11
  %40 = getelementptr double, ptr %39, i64 3, !dbg !11
  store double 4.000000e+00, ptr %40, align 8, !dbg !11
  %41 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, 1, !dbg !11
  %42 = getelementptr double, ptr %41, i64 4, !dbg !11
  store double 5.000000e+00, ptr %42, align 8, !dbg !11
  %43 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, 1, !dbg !11
  %44 = getelementptr double, ptr %43, i64 5, !dbg !11
  store double 6.000000e+00, ptr %44, align 8, !dbg !11
  %45 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !10
  %46 = getelementptr double, ptr %45, i64 0, !dbg !10
  store double 1.000000e+00, ptr %46, align 8, !dbg !10
  %47 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !10
  %48 = getelementptr double, ptr %47, i64 1, !dbg !10
  store double 2.000000e+00, ptr %48, align 8, !dbg !10
  %49 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !10
  %50 = getelementptr double, ptr %49, i64 2, !dbg !10
  store double 3.000000e+00, ptr %50, align 8, !dbg !10
  %51 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !10
  %52 = getelementptr double, ptr %51, i64 3, !dbg !10
  store double 4.000000e+00, ptr %52, align 8, !dbg !10
  %53 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !10
  %54 = getelementptr double, ptr %53, i64 4, !dbg !10
  store double 5.000000e+00, ptr %54, align 8, !dbg !10
  %55 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !10
  %56 = getelementptr double, ptr %55, i64 5, !dbg !10
  store double 6.000000e+00, ptr %56, align 8, !dbg !10
  %57 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !9
  %58 = getelementptr double, ptr %57, i64 0, !dbg !9
  store double 1.000000e+00, ptr %58, align 8, !dbg !9
  %59 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !9
  %60 = getelementptr double, ptr %59, i64 1, !dbg !9
  store double 2.000000e+00, ptr %60, align 8, !dbg !9
  %61 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !9
  %62 = getelementptr double, ptr %61, i64 2, !dbg !9
  store double 3.000000e+00, ptr %62, align 8, !dbg !9
  %63 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !9
  %64 = getelementptr double, ptr %63, i64 3, !dbg !9
  store double 4.000000e+00, ptr %64, align 8, !dbg !9
  %65 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !9
  %66 = getelementptr double, ptr %65, i64 4, !dbg !9
  store double 5.000000e+00, ptr %66, align 8, !dbg !9
  %67 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !9
  %68 = getelementptr double, ptr %67, i64 5, !dbg !9
  store double 6.000000e+00, ptr %68, align 8, !dbg !9
  br label %69, !dbg !7

69:                                               ; preds = %93, %0
  %70 = phi i64 [ 0, %0 ], [ %94, %93 ]
  %71 = icmp slt i64 %70, 2, !dbg !7
  br i1 %71, label %72, label %95, !dbg !7

72:                                               ; preds = %69
  br label %73, !dbg !7

73:                                               ; preds = %76, %72
  %74 = phi i64 [ 0, %72 ], [ %92, %76 ]
  %75 = icmp slt i64 %74, 3, !dbg !7
  br i1 %75, label %76, label %93, !dbg !7

76:                                               ; preds = %73
  %77 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !7
  %78 = mul i64 %70, 3, !dbg !7
  %79 = add i64 %78, %74, !dbg !7
  %80 = getelementptr double, ptr %77, i64 %79, !dbg !7
  %81 = load double, ptr %80, align 8, !dbg !7
  %82 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !7
  %83 = mul i64 %70, 3, !dbg !7
  %84 = add i64 %83, %74, !dbg !7
  %85 = getelementptr double, ptr %82, i64 %84, !dbg !7
  %86 = load double, ptr %85, align 8, !dbg !7
  %87 = fadd double %81, %86, !dbg !7
  %88 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !7
  %89 = mul i64 %70, 3, !dbg !7
  %90 = add i64 %89, %74, !dbg !7
  %91 = getelementptr double, ptr %88, i64 %90, !dbg !7
  store double %87, ptr %91, align 8, !dbg !7
  %92 = add i64 %74, 1, !dbg !7
  br label %73, !dbg !7

93:                                               ; preds = %73
  %94 = add i64 %70, 1, !dbg !7
  br label %69, !dbg !7

95:                                               ; preds = %69
  br label %96, !dbg !12

96:                                               ; preds = %111, %95
  %97 = phi i64 [ 0, %95 ], [ %113, %111 ]
  %98 = icmp slt i64 %97, 2, !dbg !12
  br i1 %98, label %99, label %114, !dbg !12

99:                                               ; preds = %96
  br label %100, !dbg !12

100:                                              ; preds = %103, %99
  %101 = phi i64 [ 0, %99 ], [ %110, %103 ]
  %102 = icmp slt i64 %101, 3, !dbg !12
  br i1 %102, label %103, label %111, !dbg !12

103:                                              ; preds = %100
  %104 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !12
  %105 = mul i64 %97, 3, !dbg !12
  %106 = add i64 %105, %101, !dbg !12
  %107 = getelementptr double, ptr %104, i64 %106, !dbg !12
  %108 = load double, ptr %107, align 8, !dbg !12
  %109 = call i32 (ptr, ...) @printf(ptr @frmt_spec, double %108), !dbg !12
  %110 = add i64 %101, 1, !dbg !12
  br label %100, !dbg !12

111:                                              ; preds = %100
  %112 = call i32 (ptr, ...) @printf(ptr @nl), !dbg !12
  %113 = add i64 %97, 1, !dbg !12
  br label %96, !dbg !12

114:                                              ; preds = %96
  %115 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, 0, !dbg !11
  call void @free(ptr %115), !dbg !11
  %116 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 0, !dbg !10
  call void @free(ptr %116), !dbg !10
  %117 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 0, !dbg !9
  call void @free(ptr %117), !dbg !9
  %118 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 0, !dbg !7
  call void @free(ptr %118), !dbg !7
  ret void, !dbg !13
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "../test/Hello/print.mlir", directory: "/home/kaviya/kaviya/mlir_hello_dev/mlir-hello/build")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 7, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 6, column: 10, scope: !8)
!10 = !DILocation(line: 5, column: 10, scope: !8)
!11 = !DILocation(line: 3, column: 10, scope: !8)
!12 = !DILocation(line: 8, column: 5, scope: !8)
!13 = !DILocation(line: 9, column: 5, scope: !8)


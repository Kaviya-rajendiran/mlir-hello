// CHECK: define void @main()
func.func @main() {
   %1 = "hello.constant"() {value = dense<[[11.000000e+00, 21.000000e+00, 31.000000e+00], [41.000000e+00, 51.000000e+00, 61.000000e+00]]> : tensor<2x3xf32>} : () -> tensor<2x3xf32>
   %2 = "hello.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>} : () -> tensor<2x3xf32>
   %sum="hello.Add"(%1, %2) : (tensor<2x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32> //"hello.add" %1,%2 : (tensor<2x3xf64>),(tensor<2x3xf64>)
   "hello.print"(%sum) : (tensor<2x3xf32>) -> ()
    return

}
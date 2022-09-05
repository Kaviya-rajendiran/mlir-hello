// CHECK: define void @main()
func.func @main() {
    %0 = "hello.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>} : () -> tensor<2x3xf64>
   // "hello.print"(%0) : (tensor<2x3xf64>) -> ()
    %1 = "hello.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>} : () -> tensor<2x3xf64>
    %2 = "hello.constant"() {value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf64>} : () -> tensor<2x3xf64>
    %sum="hello.Add"(%1, %2) : (tensor<2x3xf64>, tensor<2x3xf64>) -> tensor<2x3xf64> //"hello.add" %1,%2 : (tensor<2x3xf64>),(tensor<2x3xf64>)
    "hello.print"(%sum) : (tensor<2x3xf64>) -> ()
    return
}
// %3 = "hello.constant"() {value = dense<[[0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<2x3xf64>} : () -> tensor<2x3xf64>
    //%4="hello.add" (%1) : (tensor<2x3xf64>), (%2) : (tensor<2x3xf64>)-> (%3) : (tensor<2x3xf64>)   //ins ("Value":%1, "Value":%2))
    
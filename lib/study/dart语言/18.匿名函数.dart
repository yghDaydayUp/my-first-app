void main(List<String> args) {
  // test();
  onTest(test);
  print(add(1, 2));
}

// 声明了一个匿名函数赋值test变量
Function test = () {
  print("测试数据");
};
void onTest(Function callback) {
  callback();
}

// int add(int a, int b) {
//   return a + b;
// }
int add(int a, int b) => a + b;

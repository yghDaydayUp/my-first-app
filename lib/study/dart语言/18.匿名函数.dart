/**
 * 匿名函数 可以声明一个没有名称的函数赋值给变量，进行调用 Function 变量名 = () { }; 函数的类型使用Function来声明
 * 1. 匿名函数没有函数名，通常用于回调函数
 * 2. 匿名函数可以赋值给变量，变量名就相当于函数名
 * 3. 匿名函数可以作为参数传递给其他函数
 */

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

/*
  箭头函数 当函数体只有一行代码时，可以使用箭头函数编写    语法：函数名 () => 代码逻辑
*/
int add(int a, int b) => a + b;

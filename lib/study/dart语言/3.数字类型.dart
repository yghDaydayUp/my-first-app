void main(List<String> args) {
  // int
  // num
  // double
  int friendCount = 3;
  print('我有$friendCount个朋友');
  num rest = 1.5;
  print('我有$rest月的假期');
  double appleCount = 1.5;
  print('我买了$appleCount斤苹果');
  //friendCount = appleCount; // 不允许直接赋值
  //friendCount = appleCount.toInt();
  appleCount = friendCount.toDouble();
  appleCount = rest.toDouble(); // num可以转化成double给double赋值
  rest = appleCount; // double可以直接给num赋值
}

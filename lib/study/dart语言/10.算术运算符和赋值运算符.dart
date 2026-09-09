void main(List<String> args) {
  double item = 10.99;
  double allPrice = item * 4;
  double money = 100;
  double lastMoney = money - allPrice;
  // double everyMoney = lastMoney / 4;
  int everyMoney = lastMoney ~/ 4;
  print(everyMoney);
  print(10 % 4);

// 赋值运算符
  double a = 1;
  a += 2; // a = a + 2
  print(a);
  a -= 1; //  a = a - 1
  print(a);
  a *= 2; // a = a * 2
  print(a);
  a /= 2; // a = a / 2;
  print(a);
}

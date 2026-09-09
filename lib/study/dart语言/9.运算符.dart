void main(List<String> args) {
  double item = 10.99; // 商品单价
  double allPrice = item * 4; // 乘法
  double money = 100; //
  double lastMoney = money - allPrice; // 减法
  // double everyMoney = lastMoney / 4; // 除法
  int everyMoney = lastMoney ~/ 4; // 整除
  // int everyMoney = 10 % 4; // 取余数
  print(everyMoney);
}

void main(List<String> args) {
  int a = 1;
  int b = 2;
  print(a == b);
  print(a != b);
  print(a > b);
  print(a >= b);
  print(a < b);
  print(a <= b);

  // 逻辑运算符
  bool isOpenDoor = false; // 是否开门
  bool isOpenLight = true; // 是否开灯

  // 门和灯同时打开
  print(isOpenDoor && isOpenLight);
  print(isOpenDoor || isOpenLight); // 门和灯至少打开一个
  print(!isOpenDoor);
  print(!isOpenLight);
}

void main(List<String> args) {
  List foods = [
    "第一个包子",
    "第二个包子",
    "第三个包子",
    "第四个包子",
    "第五个包子", // 4
  ];
  int index = 0;
  while (index < foods.length) {
    if (index == 2) {
      // break; // break跳出整个循环
      index += 1;
      continue; // 跳出当前迭代
    }
    print(foods[index]);
    index += 1;
  }
  // 第一种场景 吃到第二个的时候 就已经吃饱了 跳出整个循环使用break;
  // 第二种场景 要开始吃第三个包子的时候 包子里有个虫子 跳过第三个 要接着吃第四五个
}

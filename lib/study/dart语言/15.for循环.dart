void main(List<String> args) {
  List foods = [
    "第一个包子",
    "第二个包子",
    "第三个包子",
    "第四个包子",
    "第五个包子", // 4
  ];
  for (var i = 0; i < foods.length; i++) {
    // 吃两个吃饱了
    if (i == 2) {
      // break; 跳出整个循环
      continue; // 跳出当前迭代
    }
    print(foods[i]);
  }
}

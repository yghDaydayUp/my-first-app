void main(List<String> args) {
  int score = 81;
  // 单条件情况
  if (score > 60) {
    print("恭喜你及格");
  }
  bool isMarry = false;
  if (isMarry) {
    print("恭喜你成家");
  } else {
    print("还没结婚哦");
  }

  if (score > 80) {
    print("优秀");
  } else if (score >= 60) {
    print("及格");
  } else {
    print("不及格");
  }
  // 三元运算符中不能再写if else
  print(59 >= 60 ? "及格" : '不及格');
}

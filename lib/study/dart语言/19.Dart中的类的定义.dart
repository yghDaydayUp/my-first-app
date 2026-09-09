void main(List<String> args) {
  Person p = Person();
  p.name = "老高";
  p.study();
}

class Person {
  String name = ""; // 姓名
  int age = 0; // 年龄
  String sex = "男";
  void study() {
    print("$name在学习");
  }
}

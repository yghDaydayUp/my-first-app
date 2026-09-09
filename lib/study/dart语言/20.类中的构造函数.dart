void main(List<String> args) {
  Person p = Person(name: '老高', age: 20, sex: '男');
  // p.name = "老高";
  p.study();
  Person pp = Person(name: '小张', age: 20, sex: '男');
  pp.study();
}

class Person {
  String? name = ""; // 姓名
  int? age = 0; // 年龄
  String? sex = "男";
  //默认构造函数
  Person({String? name, int? age, String? sex}) {
    this.name = name;
    this.age = age;
    this.sex = sex;
  }

  void study() {
    print("$name在学习");
  }
}

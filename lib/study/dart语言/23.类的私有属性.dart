class Person {
  String? _name = ""; // 姓名
  int? age = 0; // 年龄
  String? sex = "男";
  //默认构造函数
  // 命名构造函数
  Person.createPerson({String? name, int? age, String? sex}) {
    this._name = name;
    this.age = age;
    this.sex = sex;
  }

  void _study() {
    print("$_name在学习");
  }
}

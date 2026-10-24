
/**
  Dart中类的公有属性和私有属性
  ● 公有属性，提供自身或者其他外部文件和类使用的属性和方法
  ● 私有属性，仅供自身使用的属性和方法，其他外部文件和类无法访问
  ● 语法：私有属性以下划线开头， 如_name，其余均为公有属性 
*/

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

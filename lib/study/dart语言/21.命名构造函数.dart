/**
  Dart中类的构造函数-命名构造函数
  ● 定义：构造函数可以采用命名的方式，返回一个实例化对象
  ● 定义语法：
  class 类名 {
  类名.构造函数名(可选命名参数) {
  }
  }
  ● 实例化语法：
  Person p = Person.构造函数名(属性: 值)
  ● 注意：默认构造函数和命名构造函数可同时存在 
 */

void main(List<String> args) {
  Person p = Person(name: '老高', age: 20, sex: '男');
  // p.name = "老高";
  p.study();
  Person pp = Person(name: '小张', age: 20, sex: '男');
  pp.study();
  Person ppp = Person.createPerson(name: '新同学', age: 30);
  ppp.study();
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
  // 命名构造函数
  Person.createPerson({String? name, int? age, String? sex}) {
    this.name = name;
    this.age = age;
    this.sex = sex;
  }

  void study() {
    print("$name在学习");
  }
}

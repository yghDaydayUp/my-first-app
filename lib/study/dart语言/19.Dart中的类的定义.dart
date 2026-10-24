/**
  ● 定义：Dart语言中，类(class)是面向对象编程的核心，类包含属性和方法来定义对象的行为和状态
  ● 需求： 定义一个Person类，属性包括姓名、年龄、性别，包括学习的方法
  ● 定义类语法： class Person { 属性 方法 }
  ● 实例化对象： Person 变量 = Person();
  ● 属性和方法： 变量.属性/方法()
 */

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

void main(List<String> args) {
  Child c = Child(name: '老高', age: 20);
  c.study();
}

// 父类
class Parent {
  String? name;
  int? age;
  Parent({this.name, this.age});
  void study() {
    print('父类-$name在学习');
  }
}

// 子类继承父类
class Child extends Parent {
  Child({String? name, int? age}) : super(name: name, age: age);
  @override
  void study() {
    // TODO: implement study
    // super.study(); // 先调用了父类的方法
    print("子类-$name在学习");
  }
}

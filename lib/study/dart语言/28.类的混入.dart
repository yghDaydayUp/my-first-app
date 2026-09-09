void main(List<String> args) {
  Student s = Student(name: '小张同学');
  s.song(s.name!);
  Teacher t = Teacher(name: '老高老师');
  t.song(t.name!);
}

// 定义一个混入对象
mixin Base {
  void song(String name) {
    print("$name在唱歌");
  }
}

class Student with Base {
  String? name;
  int? age;
  Student({this.name, this.age});
}

class Teacher with Base {
  String? name;
  int? age;
  Teacher({this.name, this.age});
}

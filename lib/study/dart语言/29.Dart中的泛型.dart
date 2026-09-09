void main(List<String> args) {
  // 列表泛型 或者Map
  List<String> list = [];
  list.add("");
  // list.add(1);
  // list.add(false);
  // list.add([]);
  Map<String, int> map = {};

  map["a"] = 1;
  getValue<String>("1");
  printList<String>(["1", "2", "3"]);
  Student<int> s = Student();
  s.name = 1;
}

// 函数中的方法
T getValue<T>(T value) {
  return value;
}

void printList<T>(List<T> list) {
  for (var i = 0; i < list.length; i++) {
    print(list[i]);
  }
}
class Student<T> {
  T? name;
}
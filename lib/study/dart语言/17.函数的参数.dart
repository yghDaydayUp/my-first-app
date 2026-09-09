void main(List<String> args) {
  add(1, 2);
  print(combine("1"));
  showPerson("老高", sex: "男");
}

int add(int a, int b) {
  return a + b;
}

// 合并字符串
String combine(String a, [String? b = "b", String? c = "c"]) {
  return a + (b ?? "") + (c ?? "");
}

void showPerson(String username, {int? age = 18, String? sex = "男"}) {
  print('姓名：$username, 年龄: $age,性别： $sex');
}

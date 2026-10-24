/**
 * 函数的参数
 * 1. 必选参数   必传参数不能为空
 * 2. 可选位置参数， 可选位置参数必须位于必传参数后面, 采用中括号包裹 函数名(String a, [ String? b, ... ])，
 * 传递时按照顺序传递 适用场景：参数少且顺序固定时 可选参数可以设置默认值
 * 3. 可选命名参数  可选命名参数必须位于必传参数后面, 采用大括号包裹 函数名(String a, { String? b, ...})，
 * 传递时按照 参数名:值的方式进行传递，无需关注顺序  参数多且需明确含义时  可选参数可以设置默认值
 */

 
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

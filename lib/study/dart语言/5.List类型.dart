void main(List<String> args) {
  List students = ["张三", "李四", "王五"];
  print(students);
  students.add("新同学"); // 在尾部进行添加
  students.add("新同学"); // 在尾部进行添加
  print(students);
  students.addAll(["新来的同学1", "新来的同学2"]); // 在尾部添加一个列表
  print(students);
  students.remove("新同学"); // 删除满足内容的第一个
  print(students);
  // 删除最后一个同学
  students.removeLast(); // 删除最后一个
  print(students);
  // 删除前两个同学
  // start开始的索引 end结束的索引-不包含在删除范围内
  students.removeRange(0, 2);
  print(students);
  // forEach针对每个列表每个数据进行操作
  students.forEach((item) {
    // 书写逻辑
    print(item);
  });
  // 是不是所有的同学都以新为开头
  print(students.every((item) {
    return item.toString().startsWith("新"); // 返回一个条件
  }));
  // 筛选出所有的以新开头的同学呢
  print(students.where((item) {
    return item.toString().startsWith("新");
  }).toList());
  // List常用的一些属性 方法() .属性
  print(students.length);
  print(students.last); // 列表的最后一个
  print(students.first); // 列表的第一个
  print(students.isEmpty); // 列表是否是空的
}

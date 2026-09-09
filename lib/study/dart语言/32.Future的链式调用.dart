void main(List<String> args) {
  // 三个异步任务 采用链式调用的方式来实现
  Future f = Future(() {
    return "Hello World";
  });
  f.then((value) {
    // 第一个任务
    return Future(() => "task1");
  }).then((value) {
    // 第二个任务
    return Future(() => "$value-task2");
  }).then((value) {
    // 第三个任务
    return Future(() => "$value-task3");
  }).then((value) {
    print(value);
    throw Exception("异常");
  }).catchError((error) {
    print("出现错误");
  });
}

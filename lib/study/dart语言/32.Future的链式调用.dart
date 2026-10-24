
/**
  Dart中异步编程-Future链式调用
  ●介绍：Future可以通过链式的方式连续得到异步的结果
  ●语法：通过Future().then() 拿到执行成功的结果
  ●语法：通过Future().catchError() 拿到执行失败的结果
  ●注意：在上一个then返回对象会在下一个then中接收
  ●需求：执行三个异步任务，按照顺序排列，最后一次任务抛出异常 
*/
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

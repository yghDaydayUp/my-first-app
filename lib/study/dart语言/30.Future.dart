/**
  Dart中异步编程-事件循环
  ●介绍：Dart是单线程语言，即同时只能做一件事，遇到耗时任务就会造成程序阻塞，此时需要异步编程
  ●定义：Dart采用单线程 + 事件循环的机制完成耗时任务的处理
  ●事件循环：
  ●微任务队列：Future.microtask()
  ●事件队列：Future、Future.delayed()、I/O 操作(文件、网络) 等
  ●微任务队列 + 事件队列都属于异步任务

  Dart中异步编程-Future
  ●介绍：Future代表一个异步操作的最终结果. ●状态：Uncompleted（等待）、Completed with a value (成功)、Completed with a error(失败)
  ●创建： Future(() {})
  ●执行成功：不抛出异常-成功状态-then(() {})
  ●执行失败： throw Exception()-失败状态-catchError(() {})
 */

void main(List<String> args) {
  Future f = Future(() {
    // return "Hello Flutter";
    // 没有抛出异常 那就是成功状态
    throw Exception();
  });
  // then中接收成功状态
  f.then((value) {
    print(value);
  });
  f.catchError((error) {
    print("出现错误了");
  });
}

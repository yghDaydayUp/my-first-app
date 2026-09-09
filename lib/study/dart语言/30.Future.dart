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

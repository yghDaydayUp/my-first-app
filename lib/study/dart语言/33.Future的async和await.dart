void main(List<String> args) {
  test(); // 调用函数
}

void test() async {
  try {
    String result = await Future(() {
      return "测试";
      // throw Exception();
    });
    // await Future.delayed(Duration(seconds: 3));
    // await下方的逻辑 永远是Future执行成功之后执行的
    print(result);
  } catch (e) {
    print("异步请求出现异常");
  }
}

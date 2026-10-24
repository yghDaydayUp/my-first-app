
/**
  Dart中异步编程-Future-async/await
  ●介绍：除了通过then/catchError的方式，还可以通过async/await来实现异步编程
  ●特点: await 总是等到后面的Future执行成功，才执行下方逻辑，async必须配套await出现
  ●语法：
  函数名 () async {
  try {
  await Future()；
  // Future执行成功才执行的逻辑
  }
  catch(error) {
  // 执行失败的逻辑
  }
  }
 */
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

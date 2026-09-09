void main(List<String> args) {
  String text = "今天是个好日子"; // 是个变量 var
  print(text);
  text = "明天同样是个好日子";
  print(text);
  // 我要在当前的时间吃饭
  String content = '我要在${DateTime.now()}吃饭';
  print(content);
  String flag = "张三";
  String content1 = '我和$flag是好朋友';
  print(content1);
}

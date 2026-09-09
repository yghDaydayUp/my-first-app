void main(List<String> args) {
  Map transMap = {"lunch": '午饭', "morning": "早上", "hello": '你好'};
  print(transMap);
  // 通过英文找到对应中文的描述
  print(transMap["morning"]);
  transMap["hello"] = "你非常好";
  print(transMap["hello"]);
  // 字典里面有很多对应关系
  transMap.forEach((key, value) {
    print("$key,$value");
  });
  // addAll 给当前字典添加一个字典
  transMap.addAll({"fine": "非常好"});
  print(transMap);
  // containesKey判断字典中是否包含某个key
  print(transMap.containsKey("fine"));

  transMap.remove("fine");
  print(transMap);

// 清空字典
  transMap.clear();
  print(transMap);
}

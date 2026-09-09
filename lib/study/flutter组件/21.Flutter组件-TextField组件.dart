import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget{
 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MianPage();
  }
}

class _MianPage extends State<MainPage>{
 TextEditingController _phoneController = TextEditingController();
 TextEditingController _codeController = TextEditingController(); // 密码控制器
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("登录",style: TextStyle(color:Colors.red,fontSize: 20)),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                controller: _phoneController,
                onChanged: (value) {
                  print(value);
                },
                onSubmitted: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20), // 内容内边距
                    hintText: "请输入账号",
                    fillColor: const Color.fromARGB(255, 222, 219, 207),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(height: 20),
               TextField(
                controller: _codeController,
                obscureText: true, // 不显示实际内容 用来做密码框显示
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20), // 内容内边距
                    hintText: "请输入密码",
                    fillColor: const Color.fromARGB(255, 222, 219, 207),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25))),
              ),
                SizedBox(height: 20),
               Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                    onPressed: () {
                      print(
                          "登录-${_phoneController.text}-${_codeController.text}");
                    },
                    child: Text("登录", style: TextStyle(color: Colors.white))),
              )
              ],
            ),
           
          ),
        )
     );

  }
  
}

/**
 * 使用TextField必须使用有状态组件
 * 使用 TextEditingController管理输入内容、onChanged可以监听数据变化
 * decoration属性下的 InputDecoration来定制如 边框、背景、提示文字
 * obscureText设置为 true可隐藏输入内容，用于密码输入框
*/
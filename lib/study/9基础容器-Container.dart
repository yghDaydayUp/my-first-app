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
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
        body:Container(
          margin: EdgeInsets.all(80),
          padding: EdgeInsets.all(30),
          width: 200,
          height: 200,
          decoration: BoxDecoration(//复杂的装饰 替代简单的 color
            color: Colors.blue,//背景颜色
            borderRadius: BorderRadius.circular(15.0),//圆角
            border: Border.all(color: Colors.amber,width: 3.0),//边框
            boxShadow:[ //阴影
              BoxShadow(color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(2, 2),
              ),
            
            ],
          ),
           child: Text("Hello, Container",style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
       ),
     );
  }
}

/**
 *  基础布局组件，可以方便地容纳一个子组件，并对其施加各种样式、布局约束和变换
 */
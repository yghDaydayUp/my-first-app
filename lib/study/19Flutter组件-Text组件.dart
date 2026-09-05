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
            appBar: AppBar(
              title: Text("Text代码实例",style: TextStyle(color:Colors.red,fontSize: 20)),
          ),
          body: Container(
            width: double.infinity,//正无穷大
            height: double.infinity,//正无穷大
            // padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              ),

               child: Text.rich(TextSpan(
              text: "Hello ",
              children: [
                TextSpan(
                    text: "Flutter", style: TextStyle(color: Colors.green)),
                TextSpan(text: "!")
              ],
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.bold))),

          //    child: Text("Hello Flutter!",
          //       style: TextStyle(
          //       fontSize: 20,//字体大小
          //       color: Colors.blue,//字体颜色
          //       fontStyle: FontStyle.italic,//字体样式(如斜体)
          //       fontWeight: FontWeight.w900,
          //       decoration: TextDecoration.underline,//装饰（如下划线）
          //       decorationColor: Colors.red),
          // ),

            // child: Text("你好!我是Flutter,你好!我是Flutter,你好!我是Flutter,你好!我是Flutter,你好!我是Flutter,你好!我是Flutter,你好!我是Flutter,你好!我是Flutter,你好!我是Flutter,",
            // style: TextStyle(color: Colors.blue,fontSize: 20),
            // maxLines: 2,//字体行数显示
            // overflow: TextOverflow.ellipsis, //超出部分...
            // softWrap: true, // 超出部分允许换行
            // ),
           ),
           
          ),        
     );

  }
  
}

/**
*适用场景：所有的文本显示都需要Text组件
*Text组件本身和其 TextStyle中都可能有 overflow等属性,Text组件属性优先级更高
*假如文本过长请务必设置 maxLines和 overflow。
*大量重复使用的文本样式，建议统一定义， 有助于保持一致性并提升性能
*如果需要在同一段文本中显示不同样式，可用Text.rich构造函数配合TextSpan来实现
*/
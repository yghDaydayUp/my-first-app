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
          title:Text("线性布局-Column",style: TextStyle(color: Colors.red,fontSize: 20)),
        ),
        body: Container(
         height: 300,
         decoration: BoxDecoration(color: Colors.amber,
            borderRadius: BorderRadius.circular(20)),
         child: Padding(
          //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // 设置对称方向的内边距
          //  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10), // 不同的方向设置内边距
           padding: EdgeInsets.all(30), // EdgeInsets.all 设置上下左右四个内边距
            child:Container(
            decoration: BoxDecoration(color: Colors.blue,
            borderRadius: BorderRadius.circular(20)
            ),
          ),
         ),

        ),
       ),
     );
  }
}
/*
特点：功能单一而纯粹，就是添加内边距。如果需求仅是为组件添加间距，那么直接使用 Padding组件
区别：Container也有padding属性,单一需求用 Padding组件，复杂样式用 Container
*/
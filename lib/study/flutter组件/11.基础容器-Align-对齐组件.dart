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
          title:Text("Align代码实例",style: TextStyle(color: Colors.red,fontSize: 20)),
        ),
        body: Container(//Center不能设置宽高实现固定宽高且居中的组件：Center去包裹一个具有固定宽高的子组件。Container/SizeBox
          color: Colors.blue,
          child: Align(
            alignment: Alignment.bottomCenter,
            widthFactor: 3,//Align的宽度将是子组件宽度乘以该因子
            heightFactor: 3,//Align的高度将是子组件高度乘以该因子
            child: Icon(
              Icons.star,
              size: 50,
              color: Colors.amber,

            ),
          
          ),

        ),
       ),
     );
  }
}

/** 
 * 基础容器-Align-对齐组件
 *与Center的区别：Center是 Align的一个特例，继承自 Align，相当于一个将 alignment属性为居中的Align.center
 *使用场景：当需要将一个组件放置在父容器的特定角落，Align是理想选择。 
 *动态尺寸：通过 widthFactor和 heightFactor，可以创建出与子组件大小成比例的容器，动态布局中很有用
 * 
 */
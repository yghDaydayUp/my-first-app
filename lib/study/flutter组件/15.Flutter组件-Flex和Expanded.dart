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
              title: Text("Flex代码实例",style: TextStyle(color:Colors.red,fontSize: 20)),
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
               child: Flex(
              direction: Axis.vertical,  // 垂直方向
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                  height: 100,
                 
                 color: Colors.red,
                )),
                 Expanded(
                  flex: 1,
                  child: Container(
                  height: 100,
           
                 color: Colors.blue,
                ))
              ],
             ),
              
           ),
            

              /*
            child: Flex(
              direction: Axis.horizontal, // 水平方向
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                   height: 100,
                   width: 100,
                   color: Colors.blue,
                ) ),
                 Expanded(
                  flex: 3,
                  child: Container(
                   height: 100,
                   width: 100,
                   color: Colors.red,
                )
              )
              ],
            ),
            */
           
          ),        
     );

  }
  
}

/**
Expanded 与 Flexible 的区别: Expanded强制子组件填满所有剩余空间, Flexible根据自身大小调整,不强制占满空间
*/
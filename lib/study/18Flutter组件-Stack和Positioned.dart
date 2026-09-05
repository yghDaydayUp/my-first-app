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
              title: Text("Stack代码实例",style: TextStyle(color:Colors.red,fontSize: 20)),
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
             child: Stack(
              children: [
                 Container(
                width: 200,
                height: 200,
                color: Colors.grey,
              ),
               Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  )),
              Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                color: Colors.blue,
                width: 50,
                height: 50,
              )),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  )),
              Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  )),
                  // Positioned(
                  //   top: 0,
                  //   bottom: 0,
                  //   right: 0,
                  //   left: 0,
                  //   child: Container(
                  //   color: Colors.green,
                  //   width: 50,
                  //   height: 50,
                  // )),


              ],
             ),

             // Stack的基础用法
          // child: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     Container(
          //       width: 300,
          //       height: 300,
          //       color: Colors.blue,
          //     ),
          //     Container(
          //       width: 200,
          //       height: 200,
          //       color: Colors.red,
          //     ),
          //     Container(
          //       width: 100,
          //       height: 100,
          //       color: Colors.amber,
          //     ),
          //     Container(
          //       width: 50,
          //       height: 50,
          //       color: Colors.green,
          //     ),
          //   ],
          // ),
           ),
           
          ),        
     );

  }
  
}

/**
*层叠布局组件，允许你将多个子组件按照 Z 轴（深度方向）进行叠加排列
*搭档：Positioned组件是 Stack的黄金搭档，对子组件进行精确定位控制。Positioned必须作为 Stack的直接子组件。
*  Positioned通过left、right、top、bottom 来将子组件“钉”在 Stack的某个角落或边缘
*/
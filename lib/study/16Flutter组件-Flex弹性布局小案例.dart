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

                //顶部和底部高度固定，中间区域充满剩余空间
                direction: Axis.vertical,
               children: [
                 Container(
                  height: 100,
                 color: Colors.red,
                ),
                   Expanded(
                  child: Container(
                 color: Colors.greenAccent,
                )),
           
                  Container(
                  height: 100,
                 color: Colors.blue,
                )
               ],
              
              )

           ),
          ),        
     );

  }
  
}

/**
 * 场景：顶部和底部高度固定，中间区域充满剩余空间
 */
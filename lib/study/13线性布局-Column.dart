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
              title: Text("线性布局-Column",style: TextStyle(color:Colors.red,fontSize: 20)),
          ),
          body: Container(
            width: double.infinity,//正无穷大
            height: double.infinity,//正无穷大
            // padding: EdgeInsets.all(20),
            // margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,// 两头对齐
              // mainAxisAlignment: MainAxisAlignment.spaceAround, // 环绕模式
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,//均分模式
              // mainAxisAlignment: MainAxisAlignment.start, // 从头排列
              // mainAxisAlignment: MainAxisAlignment.end, // 从尾部排列
               mainAxisAlignment: MainAxisAlignment.center,
             //  crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴start
              crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴居中
             // crossAxisAlignment: CrossAxisAlignment.end, // 交叉轴end
            

              children: [
                Container(
                 width: 100,
                 height: 100,
                 color:Colors.blue,
                ),
                // SizedBox(
                //   height: 10,
                // ),
                 Container(
                margin: EdgeInsets.only(top: 10),
                width: 100,
                 height: 100,
                 color:Colors.blue,
                ),
                //  SizedBox(
                //   height: 10,
                // ),
                 Container(
                 margin: EdgeInsets.only(top: 10),
                 width: 100,
                 height: 100,
                 color:Colors.blue,
                ),
              ],
            ),

            ),
          ),        
     );

  }
  
}

/*
注意事项：Column本身不支持滚动，如果内容超出，需要使用ListView或者SingleChildScrollView包裹
明确尺寸约束，父组件的大小直接影响Column的最终大小和子组件的布局行为
避免过度嵌套，过深的嵌套会影响性能并增加代码维护难度
*/
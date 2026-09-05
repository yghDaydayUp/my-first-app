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

  List<Widget> getList(){
    return List.generate(10, (index){
     return Container(
       width: 100,
       height: 100,
       color: Colors.blue,
     );

    });
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Wrap代码实例",style: TextStyle(color:Colors.red,fontSize: 20)),
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
             child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: getList(),
             ), 
           ),
           
          ),        
     );

  }
  
}

/**
 *当子组件内容是根据数据动态生成时，使用 Wrap 可以确保布局始终适配
 *List.generate是一个构造器，用于快速创建长度固定且每个元素可以通过索引号确定的列表
*/
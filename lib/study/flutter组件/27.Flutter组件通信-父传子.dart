import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

void main() {
  runApp(MainPage());
}
/*
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("父组件",style: TextStyle(color: Colors.blue,fontSize: 30)),
              // Child(message:"老杨",)
              Child(message: "老杨有状态",)
            ],
          ),
        ),
      ),
    );
  }
}

//无状态子组件 父传子
class Child extends StatelessWidget {
  final String ?message;// 定义属性
  const Child({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child:Text("子组件-$message",style: TextStyle(color: Colors.red)),
    );
  }
}

//有状态子组件 父传子
 class Child extends StatefulWidget {
   final String ?message;
   const Child({super.key, this.message});
 
   @override
   State<Child> createState() => _ChildState();
 }
 
 class _ChildState extends State<Child> {
   @override
   Widget build(BuildContext context) {
     return Container(
       alignment: Alignment.center,
      child:Text("子组件-${widget.message}",style: TextStyle(color: Colors.red)),
     );
   }
 }
*/

//父组件 父传子案例
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> _list = ["鱼香肉丝", "宫保鸡丁", "麻婆豆腐", "京酱肉丝", "溜肉片"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
           mainAxisSpacing: 10,
           crossAxisSpacing: 10,
           children: List.generate(_list.length, (int index){
            return Child(foodName: _list[index]);// 返回整个的子组件
           }),
          ),
      ),
    );
  }
}

//子组件
class Child extends StatefulWidget {
  final String foodName;
  const Child({super.key, required this.foodName});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      alignment: Alignment.center,
      child: Text("${widget.foodName}",style: TextStyle(color: Colors.white,fontSize: 20)),
    );
  }
}

/**
 * 步骤： 
 * 1. 子组件定义接收属性 
 * 2. 子组件在构造函数中接收参数
 * 3. 父组件传递属性给子组件
 * 4. 有状态组件在‘对外的类’接收属性，‘对内的类’通过widget对象获取对应属性
 * 5. 注意⚠：子组件定义接收属性需要使用final关键字-因为属性由父组件决定，子组件不能随意更改
 *  
 * 
 * 子组件属性如果没有初始值，需要在构造函数中用required来接收属性
 */
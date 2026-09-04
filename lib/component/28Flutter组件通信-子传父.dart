import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

void main() {
  runApp(MainPage());
}

//父组件
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
            return Child(
              foodName: _list[index],
               index: index, 
               delFood: (int i) {
                 _list.removeAt(i);
                 setState(() { });//刷新状态
               },
             );// 返回整个的子组件
           }),
          ),
      ),
    );
  }
}

//子组件
class Child extends StatefulWidget {
  final String foodName;
  final int index;// 索引
  final Function (int index) delFood;//声明函数属性
  const Child({super.key, required this.foodName, required this.index, required this.delFood});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Stack(//堆叠组件
       alignment: Alignment.topRight,
      children: [
         Container(
         decoration: BoxDecoration(color: Colors.blue),
         alignment: Alignment.center,
         child: Text("${widget.foodName}",style: TextStyle(color: Colors.white,fontSize: 20)),
        ),
        IconButton(
         color: Colors.red, 
         onPressed:(){
          widget.delFood(widget.index);
         }, 
        icon: Icon(Icons.delete)
        )
      ],
    );
    
   
  }
}

/**
 * 步骤： 
 * 1. 父组件传递一个函数给子组件 
 * 2. 子组件调用该函数
 * 3. 父组件通过回调函数获取参数
 */
import 'package:flutter/material.dart';

class IDOMoreList extends StatefulWidget {
  const IDOMoreList({super.key});

  @override
  State<IDOMoreList> createState() => _IDOMoreListState();
}

class _IDOMoreListState extends State<IDOMoreList> {
  @override
  Widget build(BuildContext context) {
    //必须是Sliver家族的组件
    return SliverGrid.builder(//builder按需加载
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,//列数
        mainAxisSpacing: 10,//主轴间距
        crossAxisSpacing: 10,//交叉轴间距
       ), 
      itemBuilder: (BuildContext context, int index){
          return Container(
           color: Colors.blue,
           alignment: Alignment.center,
           child: Text("商品$index",style: TextStyle(color: Colors.white,fontSize: 10)),
           
          );
       }
    );
  }
}
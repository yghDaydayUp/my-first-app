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

class _MianPage extends State<MainPage> {
 TextEditingController _phoneController = TextEditingController(); // 账号控制器
  TextEditingController _codeController = TextEditingController(); // 密码控制器
  ScrollController _controller = ScrollController(); //滚动条控制器
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("GridView组件代码实例"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          // 按照列数去固定
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 4,
          //     mainAxisSpacing: 10,
          //     crossAxisSpacing: 10), // 布局委托
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text("第${index + 1}个",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            );
          }),
      // body: GridView.extent(
      //   scrollDirection: Axis.horizontal,
      //   padding: EdgeInsets.all(10),
      //   maxCrossAxisExtent: 200, // 最大宽度或者高度来决定
      //   mainAxisSpacing: 10,
      //   crossAxisSpacing: 10,
      //   children: List.generate(100, (int index) {
      //     return Container(
      //       alignment: Alignment.center,
      //       color: Colors.blue,
      //       child: Text("第${index + 1}个",
      //           style: TextStyle(color: Colors.white, fontSize: 20)),
      //     );
      //   }),
      // )
      // body: GridView.count(
      //   scrollDirection: Axis.vertical,
      //   padding: EdgeInsets.all(10),
      //   crossAxisCount: 2, // 设置固定的列数或者行数
      //   mainAxisSpacing: 10,
      //   crossAxisSpacing: 10,
      //   children: List.generate(100, (int index) {
      //     return Container(
      //       alignment: Alignment.center,
      //       color: Colors.blue,
      //       child: Text("第${index + 1}个",
      //           style: TextStyle(color: Colors.white, fontSize: 20)),
      //     );
      //   }),
      // ),
    ));
  }
  
}

/**
 * 作用：用于创建二维可滚动网格布局的核心组件
 * 方式：提供多种构建方式，GridView.count、GridView.extent、GridView.builder等
 * GridView默认构造方式-(写起来最过繁琐，很少使用)
 * GridView.count-基于固定列数的网格布局(最常用之一
 * GridView.extent-基于固定子项最大宽度/高度的网格布局(最常用之二)
 * GridView.builder用于网格项数量巨大或动态生成的情况，需要接收gridDelegate布局委托属性
 * 
 * gridDelegate：SliverGridDelegateWithFixedCrossAxisCount：固定列数 mainAxisSpacing 主轴间距
 * SliverGridDelegateWithMaxCrossAxisExtent：最大宽度 crossAxisSpacing 交叉轴间距
 * scrollDirection设置滚动方向横向/纵向(默认)
*/
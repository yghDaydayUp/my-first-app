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
        title: Text("ListView组件代码实例"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // margin: EdgeInsets.only(top: 10),
              color: Colors.blue,
              width: double.infinity,
              height: 80,
              child: Text(
                '第${index + 1}个',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              alignment: Alignment.center,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
                height: 10, width: double.infinity, color: Colors.amber);
          },
          itemCount: 100),
      // body: ListView.builder(
      //   itemCount: 100, // 列表项的长度是多少
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       margin: EdgeInsets.only(top: 10),
      //       color: Colors.blue,
      //       width: double.infinity,
      //       height: 80,
      //       child: Text(
      //         '第${index + 1}个',
      //         style: TextStyle(color: Colors.white, fontSize: 30),
      //       ),
      //       alignment: Alignment.center,
      //     );
      //   },
      //   padding: EdgeInsets.all(20),
      //   // children: List.generate(100, (index) {
      //   //   return Container(
      //   //     margin: EdgeInsets.only(top: 10),
      //   //     color: Colors.blue,
      //   //     width: double.infinity,
      //   //     height: 80,
      //   //     child: Text(
      //   //       '第${index + 1}个',
      //   //       style: TextStyle(color: Colors.white, fontSize: 30),
      //   //     ),
      //   //     alignment: Alignment.center,
      //   //   );
      //   // }),
      // ),
    ));
  }
}

/**
 * 作用：用于构建可滚动列表的核心部件,并提供流畅滚动体验
 * 方式：提供多种构造函数，如默认构造函数、ListView.builder、ListView.separated
 *  机制：采用按需渲染（懒加载），只构建当前可见区域的列表项，极大提升长列表性能
 * 
 * separated模式
 * 在 ListView.builder的基础上，额外提供了构建分割线的能力
 * 需要同时提供itemBuilder、separatorBuilder、itemCount三个属性
 * 
*/
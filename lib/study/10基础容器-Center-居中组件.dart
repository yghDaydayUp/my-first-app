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
          title:Text("Center 示例",style: TextStyle(color: Colors.red,fontSize: 20)),
        ),
        body: Center(
          ////Center不能设置宽高实现固定宽高且居中的组件：Center去包裹一个具有固定宽高的子组件。Container/SizeBox
           child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text("居然内容",style: TextStyle(color: Colors.red,fontSize: 30)),
             
            ),
           ),
        ),
       ),
     );
  }
}

/**
 * 
 * 应用场景： 页面内容整体居中，如将一个登录表单或一个加载中的提示图标在页面正中显示
 *注意事项：Center不能设置宽高，Center的最终大小取决于其父组件传递给它的约束, Center会向它的父组件申请尽可能大的空间
 *实现固定宽高且居中的组件：Center去包裹一个具有固定宽高的子组件。Container/SizeBox
 * 
 */
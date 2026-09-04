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
              title: Text("Image代码实例",style: TextStyle(color:Colors.red,fontSize: 20)),
          ),
          body: Container(
            alignment: Alignment.center,
            width: double.infinity,//正无穷大
            height: double.infinity,//正无穷大
            // padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              ),
            child: Image.network(
            "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),


            // child: Image.asset(
            //   "lib/images/github.jpg",
            //   width: 200,
            //   height: 200,
            //   fit: BoxFit.contain,
            //  // fit: BoxFit.cover,
            //   // fit: BoxFit.fill,
            //  // fit: BoxFit.fitWidth,
            // ),

           
          ),
        )
     );

  }
  
}

/**
注意：Android/HarmonyOS/iOS使用Image.network需要配置网络权限
*/
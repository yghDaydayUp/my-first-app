//管理我们的路由
import 'package:flutter/material.dart';
import 'package:my_first_app/pages/Login/index.dart';
import 'package:my_first_app/pages/Main/index.dart';

Widget getRootWidget(){
  return MaterialApp(
     //命名路由
    initialRoute: "/",//默认的组件
    routes:getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes(){
    
    return {
       "/" :(context) => MainPage(),//主页路由
       "/login":(context) => LoginPage()//登录路由
    };
}    
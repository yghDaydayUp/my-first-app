//管理我们的路由
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_first_app/pages/Login/index.dart';
import 'package:my_first_app/pages/Main/index.dart';

Widget getRootWidget(){
  return MaterialApp(
     //命名路由
    initialRoute: "/",//默认的组件
    routes:getRootRoutes(),

     //桌面端（macOS/Windows/Linux） 只能用滚轮滚动我， 加上后鼠标按住拖拽来滚动列表
    scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,    // 触摸（手机/模拟器）
          PointerDeviceKind.mouse,    // 鼠标（macOS 桌面端）
          PointerDeviceKind.stylus,   // 触控笔（可选）
          PointerDeviceKind.trackpad, // 触控板（可选）
        },
      ),

  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes(){
    
    return {
       "/" :(context) => MainPage(),//主页路由
       "/login":(context) => LoginPage()//登录路由
    };
}    
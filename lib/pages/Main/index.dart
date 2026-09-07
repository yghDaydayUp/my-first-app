import 'package:flutter/material.dart';
import 'package:my_first_app/pages/Cart/index.dart';
import 'package:my_first_app/pages/Category/index.dart';
import 'package:my_first_app/pages/Home/index.dart';
import 'package:my_first_app/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //定义BarItem数据 根据数据进行渲染4个导航 
  //一般应用程序的导航是固定的 
  final List<Map<String,String>>_tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_home_active.png", // 激活显示的图标
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_pro_active.png", // 激活显示的图标
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_cart_active.png", // 激活显示的图标
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_my_active.png", // 激活显示的图标
      "text": "我的",
    },

  ];

  int _curentIndex = 0;
 
  //返回底部渲染的BarItem列表
  List<BottomNavigationBarItem> _getBarWidget(){
    
    return List.generate(_tabList.length, (int index){
       return BottomNavigationBarItem(//BarItem相关属性赋值
        //BarItem正常图片
        icon: Image.asset(_tabList[index]["icon"]!,
        width: 30,
        height: 30),
        //BarItem激活高亮图片
        activeIcon:Image.asset(_tabList[index]["active_icon"]!,
        width: 30,
        height: 30),
        //BarItem文案
        label: _tabList[index]["text"],
        );
    });

  }

  List<Widget> _getShowWiget(){
    //这里返回了首页 分类 购物车 我的 相关封装在对于文件夹的组件
    return [HomeView(),CategoryView(),CartView(),MineView()];
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 导航栏
      // appBar: AppBar(
      //   title: Text("主页"),
      // ),

      //中间区域
      //SafeArea 安全区域 ,  IndexedStack 堆叠组件 用来管理和切换底部对于itemsBar点击后中部组件的切换
      body:SafeArea(
        child: IndexedStack(
           index: _curentIndex,//当前选中索引 和底部用的一样
           children:_getShowWiget(),//放置几个组件
         )
      ),

      //底部选项卡区域
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,//显示未选中的Item文字
        unselectedItemColor:Colors.black, //未选中的Item文字颜色 
        selectedItemColor: Colors.black,//选中的Item文字颜色
        onTap:(int index){//当前点击的索引
          _curentIndex  = index;  
          setState(() {});//刷新
          //  print(index);
        },
        currentIndex: _curentIndex,//把当前点击索引传给 BottomNavigationBar
        items: _getBarWidget(),//BarItem列表
        ),
    );
  }
}
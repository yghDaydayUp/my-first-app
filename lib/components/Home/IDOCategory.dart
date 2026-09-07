import 'package:flutter/material.dart';

class IDOCategory extends StatefulWidget {
  const IDOCategory({super.key});

  @override
  State<IDOCategory> createState() => _IDOCategoryState();
}

class _IDOCategoryState extends State<IDOCategory> {
  @override
  Widget build(BuildContext context) {
    //横行滚动的分类选项
    //这里不能直接返回 ListView() 因为 ListView()不能设置高度，ListView外层要包SizeBox或者Container确定高度 
    //返回一个横向组件
    return SizedBox(
      height:100,
      child: ListView.builder(//builder 是按需加载
        scrollDirection: Axis.horizontal,//横向
         itemCount: 10,
         itemBuilder: (BuildContext context, int index){
          return Container(
           alignment: Alignment.center,
           width: 80,
           height: 100,
           color: Colors.blue,
           child: Text("分类分类分类$index",style: TextStyle(color: Colors.white)),
           margin: EdgeInsets.symmetric(horizontal: 10),//设置横向间距

          );
        }
      ),
      
    );
  }
}
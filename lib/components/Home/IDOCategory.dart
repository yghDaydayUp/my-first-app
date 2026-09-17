import 'package:flutter/material.dart';
import 'package:my_first_app/viewmodels/home.dart';

class IDOCategory extends StatefulWidget {
  //分类列表
  final List<CategoryItem> categoryList;
  const IDOCategory({super.key, required this.categoryList});

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
         itemCount: widget.categoryList.length,//分类列表长度
         itemBuilder: (BuildContext context, int index){
          final categoryItem = widget.categoryList[index];//获取当前分类项
          return Container(
           alignment: Alignment.center,
           width: 80,
           height: 100,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),//圆角
            color: Color.fromARGB(255, 231, 232, 234),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),//设置横向间距
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,//主轴居中
              children: [
                Image.network(categoryItem.picture,width: 40,height: 40),//图片
                SizedBox(height: 5),//间隔
                Text(categoryItem.name,style: TextStyle(fontSize: 14,color: Colors.black),)//文字
              ],
            ),
          );
        }
      ),
      
    );
  }
}
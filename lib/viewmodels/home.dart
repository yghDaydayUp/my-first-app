import 'package:flutter/material.dart';

//每一个轮播图的具体类型
class BannerItem {
  String id;//可选参数
  String imgUrl;//可选参数
  //同名构造函数的语法躺写法，可选命名参数
  BannerItem({required this.id,required this.imgUrl});
}

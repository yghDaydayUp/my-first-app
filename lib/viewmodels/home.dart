
import 'package:flutter/material.dart';

//每一个轮播图的具体类型
class BannerItem {
  String id;//可选参数
  String imgUrl;//可选参数
  //同名构造函数的语法躺写法，可选命名参数
  BannerItem({required this.id,required this.imgUrl});
  //扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  //把服务器返回的 JSON 数据转换成 Dart 对象，方便在 UI 层直接使用。
  factory BannerItem.formJson(Map<String,dynamic>json){
     return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}

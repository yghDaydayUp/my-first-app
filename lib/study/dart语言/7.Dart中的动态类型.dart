/*
Dart中的动态类型-dynamic
● 定义：Dart语言中，dynamic用来声明动态类型
● 特点：允许变量运行时自由改变类型, 同时绕过编译时的静态检查
●语法1：dynamic 属性名 = 值;

Dart中的动态类型-dynamic和var的区别
● dynamic： 运行时可自由改变类型，无编译检查，方法和属性直接调用
● var: 根据初始值进行推断类型，确定类型后类型确定，有编译检查，仅限推断的属性和方法

*/

void main(List<String> args) {
  dynamic name = "张三";
  print("name的值是$name");
  name = 20;
  print("name的值是$name");
  name = true;
  print("name的值是$name");
  name = "";
  print("name的值是$name");
  name = null;
  print("name的值是$name"); 
  name = false;
  print("name的值是$name");
  name = [];
  print("name的值是$name");
  name = {};
  print("name的值是$name");

}
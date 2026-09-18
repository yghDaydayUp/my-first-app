
import 'package:flutter/material.dart';

class ToastUtils {
 //阀门控制：标记当前是否正在显示 Toast
 static bool showLoading = false;
 //显示 Toast 的方法
  static void showToast(BuildContext context, String?msg){
    //  如果阀门已打开（正在显示），直接返回，阻止重复弹出
      if(ToastUtils.showLoading){
        return;
      }
    // 打开阀门，标记"正在显示"
    ToastUtils.showLoading = true; 
     //3 秒后关闭阀门，允许下一次弹出
    Future.delayed(Duration(seconds: 3), () {
      ToastUtils.showLoading = false;
    });
     //使用 ScaffoldMessenger 显示 SnackBar
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,  // 宽度 180，配合 floating 行为实现居中窄条效果
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), // 大圆角，胶囊形状
        ),
        behavior: SnackBarBehavior.floating, // 悬浮模式（不贴底，有边距）
        duration: Duration(seconds: 3),      // 显示时长 3 秒
        content: Text(
          msg ?? "加载成功",                 //  消息内容，为空时默认"加载成功"
          textAlign: TextAlign.center,       // 文字居中
        ),
      ),
    );

  }
}
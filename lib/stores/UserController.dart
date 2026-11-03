import 'package:get/get.dart';
import 'package:my_first_app/viewmodels/user.dart';

//这是一个 **GetX 控制器**，专门用来管理全局的用户信息，配合页面 UI 自动刷新
// `extends GetxController`：继承 GetX 的控制器基类
// ✅ 作用：
// 可以用 `Get.put(UserController())` 全局注册，页面直接 `Get.find<UserController>()` 获取实例；
// 自带生命周期 `onInit()`、`onClose()`，是 GetX 状态管理的标准写法。
// 需要共享的对象 要有一些共享的属性 属性需要响应式更新
class UserController extends GetxController{
  //obs 是 GetX 的扩展属性，把普通对象包装成 Rx<UserInfo>（响应式）
  var user = UserInfo.fromJSON({}).obs;// user对象被监听了 
  // 想要取值的话 需要 user.value
  updateUserInfo(UserInfo newUser){
    //`user.value` 被重新赋值时，Obx 包裹的组件自动刷新
    //赋值一瞬间，所有监听 `user` 的 Obx 组件自动更新
    user.value = newUser;
  }
}

/*
1.安装getx插件
2. 定义一个继承GetxController的对象
3.对象中定义需要共享的属性
4. 数据需要响应式更新-需要给初始值.obs结尾
5. UI显示Getx数据需使用Obx包裹函数中使用
6.UI中使用Getx需要一个put和find动作
7.必须先put一次，才可以find
8.put仅一次，find可多次
*/
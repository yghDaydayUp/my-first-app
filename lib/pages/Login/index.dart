
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/api/user.dart';
import 'package:my_first_app/utils/LoadingDialog.dart';
import 'package:my_first_app/utils/ToastUtils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 TextEditingController _phoneController = TextEditingController(); // 账号控制器
  TextEditingController _codeController = TextEditingController(); // 密码控制器
  // 用户账号Widget
  /**
  TextFormField` 本身有自适应规则：
  放在 `Column` 里时：**宽度默认自动撑满父控件的可用宽度（等价 width: double.infinity）**
  高度：由内部内容 + `contentPadding` 自动撑开，不需要你手动写 height
  这段代码，不用写宽高，能正常渲染
    */
   Widget _buildPhoneTextField (){
      //TextFormField 是带表单能力的 TextField；TextField 只是单纯输入框，不和 Form 联动
      return TextFormField(
         validator: (value) {
        if (value == null || value.isEmpty) {
          return "手机号不能为空";
        }
        // 校验手机号格式
        if (!RegExp(r"^1[3-9]\d{9}$").hasMatch(value)) {
          return "手机号格式不正确";
        }
        return null;
      },
        controller: _phoneController,
        //BoxDecoration → 给 Container / DecoratedBox 用的，是盒子背景、边框、圆角、阴影
        //inputDecoration → 给 TextField / TextFormField 用的，专门做输入框的 UI（标签、占位、错误文字、前缀图标、边框线）
        decoration: InputDecoration(
         contentPadding: EdgeInsets.only(left: 20), // 内容内边距
        hintText: "请输入账号",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,//开启输入框填充底色
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
        ),
      );
   }

   // 用户密码Widget
  Widget _buildCodeTextField() {
    return TextFormField(
       validator: (value) {
        if (value == null || value.isEmpty) {
          return "密码不能为空";
        }
        // 密码的校验 6-16位的数字 字母或下划线
        if (!RegExp(r"^[a-zA-Z0-9_]{6,16}$").hasMatch(value)) {
          return "请输入6-16位的字母数字或者下划线";
        }
        return null;
      },
      controller: _codeController,
      obscureText: true,//密码框
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20), // 内容内边距
        hintText: "请输入密码",
        fillColor: const Color.fromRGBO(243, 243, 243, 1),
        filled: true,//开启输入框填充底色
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  bool _isChecked = false;
  // 勾选Widget
  Widget _buildCheckbox() {
    return Row(
      children: [
        // 设置勾选为圆角
        Checkbox(
          value: _isChecked,
          activeColor: Colors.black,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            _isChecked = value?? false;//`??` 叫做 空合并运算符 默认值 `false`
            setState(() {
            });
          },
          // 设置形状
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // 圆角大小
          ),
          // 可选：设置边框
          side: BorderSide(color: Colors.grey, width: 2.0),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "查看并同意"),
              TextSpan(
                text: "《隐私条款》",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(text: "和"),
              TextSpan(
                text: "《用户协议》",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
  // 头部Widget
  Widget _buildHead(){
    return Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 10),
        child: Text("账号密码登录",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        )
        )
      ],
    );
  }
_login() async {
    // 调用登录接口
    try {
      LoadingDialog.show(context, message: "努力登录中");
      final res = await loginAPI({
        "account": _phoneController.text,
        "password": _codeController.text,
      });
      LoadingDialog.hide(context);
      ToastUtils.showToast(context, "登录成功");
    
    } catch (e) {
      LoadingDialog.hide(context);
      ToastUtils.showToast(context, (e as DioException).message);
    }
    // 此时一定登录成功
    // http状态吗 2xx 业务状态吗 业务执行成功 1
  }
  // 登录按钮Widget
  Widget _buildLoginButton(){
     //SizedBox 就是一个用来占位、撑尺寸、做间距的空白盒子
     // 1. 用来做间距  2. 用来给控件强制固定宽高
     return SizedBox(
      width: double.infinity,
      height: 50,
      /*1. ElevatedButton：有底色、阴影，主按钮（登录提交首选）
        2. TextButton：文字按钮，无背景（忘记密码那种）
        3. OutlinedButton：边框按钮，空心样式
        */
      child: ElevatedButton(
        onPressed:(){
          print("登录按钮点击");
            // 登录逻辑
            //执行 `.validate()` 时： Flutter 遍历 Form 里面所有 TextFormField 
            //挨个执行每个的 `validator:(value){...}` 并做出相关提示
          if (_key.currentState!.validate()) {
            // 进行勾选框的判断
            if (_isChecked) {
              // 校验通过
               _login();
            } else {
              // 提示请勾选用户协议
              ToastUtils.showToast(context, "请勾选用户协议");
            }
          }
        } ,
        //用来改 ElevatedButton 的外观：背景色、圆角、文字颜色、阴影、内边距等等
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text("登录",style:TextStyle(color: Colors.white,fontSize: 18)),

        ),
     );
  }
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      //Form  是 Flutter 里表单根组件 
      //用来统一管理一组输入框（`TextField` / `TextFormField`）
      //统一校验、统一获取所有输入值、一次性提交
      body:Form(
        key: _key,
        child: Container(
         padding: EdgeInsets.all(30),//内边距
         color: Colors.white,
         child: Column( //竖向布局
            children: [
              SizedBox(height: 20),//空隙
              _buildHead(),
              SizedBox(height: 20),
              _buildPhoneTextField(),
              SizedBox(height: 20),
              _buildCodeTextField(),
               SizedBox(height: 20),
              _buildCheckbox(),
                SizedBox(height: 20),
              _buildLoginButton(),

            ],
         ),
       )
      )
    );
  }
}


import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodsList",
      routes: {"/goodsList": (context) => GoodsList()}, // 登录页和购物车列表页不在路由表里
      onGenerateRoute: (settings) {
        print(settings.name);
        // 去的是不是 购物车列表页
        if (settings.name == "/cartList") {
          bool isLogin = true;
          if (isLogin) {
            return MaterialPageRoute(builder: (context) => CartList());
          } else {
            return MaterialPageRoute(builder: (context) => LoginPage());
          }
        }
        // settings.name
      },
    );
  }
}

// 商品列表
class GoodsList extends StatefulWidget {
  GoodsList({Key? key}) : super(key: key);

  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cartList");
            },
            child: Text("加入购物车")),
      ),
    );
  }
}

// 购物车列表

class CartList extends StatefulWidget {
  CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车列表"),
      ),
      body: Center(
        child: TextButton(onPressed: () {}, child: Text("去支付")),
      ),
    );
  }
}

// 登录页面
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录页面"),
      ),
      body: Center(
        child: TextButton(onPressed: () {}, child: Text("去登录")),
      ),
    );
  }
}

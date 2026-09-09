import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 发起网络请求
    _getChannels(); // 获取频道数据
  }

  List<Map<String, dynamic>> _list = []; // 用来接收数据的
  void _getChannels() async {
    DioUtils util = DioUtils(); // 创建实例化对象
    Response<dynamic> result = await util.get("channels");
    Map<String, dynamic> res = result.data as Map<String, dynamic>;
    // print(res["data"]["channels"] as List<Map<String, dynamic>>);
    List data = res["data"]["channels"] as List;
    _list = data.cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;
    // cast方法强制转化列表项的类型
    setState(() {}); // 执行方法 UI才会更新
    print(_list);
    // channels是一个后端支持前端跨域访问的接口 cors 支持任何的域名进行访问
    // www.baidu.com
    // localhost:60791
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("频道管理")),
        body: GridView.extent(
          padding: EdgeInsets.all(10),
          maxCrossAxisExtent: 140,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3,
          children: List.generate(_list.length, (index) {
            return ChannelItem(item: _list[index]);
          }),
        ),
      ),
    );
  }
}

// 用来绘制每个频道的UI内容
class ChannelItem extends StatelessWidget {
  final Map<String, dynamic> item;
  const ChannelItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        item["name"] ?? "空",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

// 封装一个工具类
class DioUtils {
  final Dio _dio = Dio(); // 内部Dio实例对象
  DioUtils() {
    // 做些基本的操作
    // 配置基础地址 和超时时间
    // _dio.options.baseUrl = "https://geek.itheima.net/v1_0/";
    // _dio.options.connectTimeout = Duration(seconds: 10); // 连接超时
    // _dio.options.sendTimeout = Duration(seconds: 10); // 发送超时
    // _dio.options.receiveTimeout = Duration(seconds: 10); // 接收超时
    // 简写 ..连续赋值的写法
    _dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0/"
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);

    // 拦截器
    _addInterceptor(); // 注册添加拦截器
  }
  void _addInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
        // 请求拦截器
        onRequest: (context, handler) {
      //  handler.next(requestOptions) 放过请求
      // handler.reject(error) 拦截请求
      handler.next(context);
    },
        // 响应拦截器
        onResponse: (context, handler) {
      // http状态吗 2xx 成功 3 4 5
      // handler.reject(error)
      if (context.statusCode! >= 200 && context.statusCode! < 300) {
        handler.next(context); // 放过
        return;
      }
      // 说明出异常
      handler.reject(DioException(requestOptions: context.requestOptions));
      // 抛出异常
    },
        // 错误拦截器
        onError: (context, handler) {
      handler.reject(context); // 直接抛出异常
    }));
  }

  // 向外暴露一个get方法
  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}

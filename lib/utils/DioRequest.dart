// 居于Dio二次封装

import 'package:dio/dio.dart';
import 'package:my_first_app/constants/index.dart';

class DioRequest {
   final _dio = Dio();// dio请求对象
  // 基础地址拦截器
   DioRequest(){
     _dio.options
     ..baseUrl = GlobalConstants.BASE_URL //基础URl
     ..connectTimeout = Duration(seconds:GlobalConstants.TIME_OUT) //连接超时
     ..sendTimeout  = Duration(seconds:GlobalConstants.TIME_OUT) // 发送超时
     ..receiveTimeout =   Duration(seconds:GlobalConstants.TIME_OUT); //接收超时
     //拦截器
   }
  // 添加拦截器
   void _addInterceptor(){
      _dio.interceptors.add(
      InterceptorsWrapper(onRequest:(request,handler){
        handler.next(request);
      },
      onResponse:(response,handler){
        // http状态码 200 300
        //esponse.statusCode! 非空断言
       if(response.statusCode! >=200 &&  response.statusCode! <=300){
           handler.next(response);
           return;
       }
       //状态码不合规，手动抛出异常
       handler.reject(DioException(requestOptions: response.requestOptions));
      
      },
      onError: (error,handler){
        //错误拦截器
        //当请求出错时，把服务器返回的错误信息提取出来，替换成更友好的提示，然后重新抛出异常给上层调用方
        handler.reject(DioException(requestOptions: error.requestOptions,message: error.response?.data["msg"]??""));
      }));
   }

   //封装好的 GET 网络请求方法
  //可选的命名参数，查询参数，
  //调用 Dio 发起 GET 请求，queryParameters 会把 params 里的键值对拼接到 URL 后面
  //把 Dio 返回的 Future<Response<dynamic>> 交给 _handleResponse 函数处理，这个函数会等待请求完成、提取数据、处理错误
   Future<dynamic> get(String url ,{Map <String,dynamic>?params}){
      return _handleResponse(_dio.get(url,queryParameters: params));
   }

   
    // 进一步处理返回结果的函数
    //返回值是一个异步的 Future，类型是 dynamic（可以是任意类型）
    //统一处理网络请求的成功/失败，提取数据，处理错误
    //async 异步的，内部可以使用 await
   Future <dynamic> _handleResponse(Future<Response<dynamic>> task) async {
      try {
        //等这个网络请求跑完，把结果存到 res 里，然后继续往下走
        Response<dynamic> res = await task;
        //把响应体里的数据（res.data）强制转换成 Map<String, dynamic> 类
        final data  = res.data as Map<String,dynamic>;// data才是我们真实的接口返回的数据
        print("轮播图请求接口 $data");
        if(data["code"] == GlobalConstants.SUCCESS_CODE){
          // 才认定 http状态和业务状态均正常 就可以正常的放行通过
          return data["result"];//只要result结果
        }
         // 抛出异常
        // throw 和 rethrow 都是 Dart 中用来抛出异常的，但核心区别在于：throw 是抛出一个新异常，会重置异常堆栈；rethrow 是重新抛出当前捕获的异常，保留原始堆栈信息。
        // throw Exception(data["msg"] ?? "加载数据异常");
        throw DioException(
          requestOptions: res.requestOptions,
          message: data["msg"] ?? "加载数据失败"
          );
      } catch (e) {
         rethrow;// 不改变原来抛出的异常类型
      }
   }
}



//单例对象
final dioRequest = DioRequest();

// dio请求工具发出请求 返回的数据 Response<dynamic>.data
// 把所有的接口的data解放出来 拿到真正的数据 要判断业务状态码是不是等于1
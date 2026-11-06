import 'package:my_first_app/utils/DioRequest.dart';
import 'package:my_first_app/viewmodels/user.dart';
import 'package:my_first_app/constants/index.dart';
Future<UserInfo> loginAPI(Map<String, dynamic> data) async {

   // 先拿到响应结果
  //final response = await dioRequest.post(HttpConstants.LOGIN, data: data);
  // 打印原始返回数据！response 就是后端返回的原始map
   //print("【登录接口原始返回数据】：$response");

  return UserInfo.fromJSON(
    await dioRequest.post(HttpConstants.LOGIN, data: data),
  );
}

Future<UserInfo> getUserInfoAPI() async {
  return UserInfo.fromJSON(await dioRequest.get(HttpConstants.USER_PROFILE));
}
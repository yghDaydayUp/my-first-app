// 猜你喜欢有参数
// page: 1 pageSize: 10
import 'package:my_first_app/constants/index.dart';
import 'package:my_first_app/utils/DioRequest.dart';
import 'package:my_first_app/viewmodels/home.dart';

Future <GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  // 返回请求
  return GoodsDetailsItems.formJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
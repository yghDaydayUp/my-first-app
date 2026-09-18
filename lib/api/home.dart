// 封装一个api 目的是返回业务侧要的数据结构

import 'package:my_first_app/constants/index.dart';
import 'package:my_first_app/utils/DioRequest.dart';
import 'package:my_first_app/viewmodels/home.dart';

//轮播图数据
//异步操作，返回一个 BannerItem 类型的列表
Future <List<BannerItem>> getBannerListAPI()async{
  //返回请求
  //as List：将响应数据强制转换为 List 类型
  //.map((item) { ... })：遍历列表中的每个元素。
  //BannerItem.formJson(item as Map<String, dynamic>)：将每个元素（Map 类型）转换为 BannerItem 对象。
  //.toList()：将 map 操作的结果转换回 List
 return (await(dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
  item,
  ){
   return BannerItem.formJSON(item as Map <String, dynamic>);
  }).toList();
}

//分类列表数据
Future <List<CategoryItem>> getCategoryListAPI()async{
  //返回请求
  return (await(dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ){
    return CategoryItem.formJSON(item as Map <String, dynamic>);
  }).toList();
}

//特惠推荐数据
Future <SpecialRecommendResult> getSuggestionListAPI()async{
  //返回请求
  return SpecialRecommendResult.formJSON(
    await(dioRequest.get(HttpConstants.SUGGESTION_LIST)));
}


// 热榜推荐
Future<SpecialRecommendResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendResult.formJSON(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommendResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommendResult.formJSON(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 更多推荐 GoodDetailItem  请求参数 params
//as List 将响应数据强制转换为 List 类型
//.map((item) { ... }) 遍历列表中的每个元素
//将原始的 JSON 对象（Map<String, dynamic>）转换为强类型的 GoodDetailItem 模型对象
//.toList() 将 map 操作返回的惰性 Iterable 转换为具体的 List<GoodDetailItem>。
/**
  服务器返回 JSON 数组
       ↓
  Dio 解析为 List<dynamic>
        ↓
  遍历每个元素 (map)
        ↓
  每个元素转为 GoodDetailItem 对象 (formJSON)
        ↓
  收集为 List<GoodDetailItem>
        ↓
  返回给调用方
 */
Future<List<GoodDetailItem>> getRecommendListAPI(Map<String, dynamic> params) async {
  // 返回请求
  return (await dioRequest.get(HttpConstants.MORE_LIST,params:params ) as List).map((item) {
    return GoodDetailItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}

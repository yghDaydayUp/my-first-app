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
   return BannerItem.formJson(item as Map <String, dynamic>);
  }).toList();
}

//分类列表数据
Future <List<CategoryItem>> getCategoryListAPI()async{
  //返回请求
  return (await(dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ){
    return CategoryItem.formJson(item as Map <String, dynamic>);
  }).toList();
}

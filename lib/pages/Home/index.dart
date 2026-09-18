import 'package:flutter/material.dart';
import 'package:my_first_app/api/home.dart';
import 'package:my_first_app/components/Home/IDOCategory.dart';
import 'package:my_first_app/components/Home/IDOHot.dart';
import 'package:my_first_app/components/Home/IDOMoreList.dart';
import 'package:my_first_app/components/Home/IDOSlider.dart';
import 'package:my_first_app/components/Home/IDOSuggestion.dart';
import 'package:my_first_app/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //
  //分类数据
  List<CategoryItem> _categoryList = [];
  //轮播图数据
  List<BannerItem> _bannerList = [
  // BannerItem(
  //   id: "1", 
  //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"
  //   ),
  // BannerItem(
  //   id: "2", 
  //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png"
  //   ),
  // BannerItem(
  //   id: "3", 
  //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg"
  //   ),
];

  //https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg

 //特惠推荐数据
SpecialRecommendResult _specialRecommendResult = SpecialRecommendResult(
  id: "",
  title: "",
  subTypes: [],
);
    
// 热榜推荐
SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
  id: "",
  title: "",
  subTypes: [],
);
// 一站式推荐
SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
  id: "",
  title: "",
  subTypes: [],
);

//推荐列表
List<GoodDetailItem> _recommendList = [];

//获取滚动容器的内容
List<Widget>  _getScrollChildern(){
  //包裹普通widget的sliver家族的组件
  return [
    //轮播图组件包裹普通widget,这里IDOSlider尽量不参与sliver家族 只做普通widget显示
     SliverToBoxAdapter(child:IDOSlider(bannerList: _bannerList)),//这里用到了父传子
    //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),
    //放置分类这里需要横行排列 SliverGrid SliverList只能纵向排列
     SliverToBoxAdapter(child: IDOCategory(categoryList: _categoryList,)),//这里用到了父传子
     //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),
     //特惠推荐
     SliverToBoxAdapter(child: IDOSuggestion(specialRecommendResult: _specialRecommendResult,)),//这里用到了父传子
      //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),

     //爆款推荐
     SliverToBoxAdapter(
        child:Padding(//内边距组件
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,//横向
            children: [
              Expanded(child: IDOHot(result: _inVogueResult, type: "vogue")),//均分剩余空间
              SizedBox(width: 10),
              Expanded(child: IDOHot(result: _oneStopResult, type: "step")),//均分剩余空间
            ],
          ),
        )
      ),
       //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),
     //更多列表
     IDOMoreList(recommendList: _recommendList),

    ];
}

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //轮播列表
    _getBannderList();
    //分类列表
    _getCategoryList();
    //特惠推荐列表
    _getSpecialRecommendList();
    // 获取热榜推荐列表
    _getInVogueList();
     // 获取一站式推荐列表
     _getOneStopList();
     // 获取推荐列表
     _getRecommendList();
  }
  
    //获取轮播列表
  //async：标记为异步方法，允许内部使用 await 关键字
  void _getBannderList()async{
   _bannerList = await getBannerListAPI();
    setState(() {});//熟悉
  }

  //获取分类列表
  void _getCategoryList()async{
    _categoryList = await getCategoryListAPI();
    setState(() {});
  }

  //获取特惠推荐数据
  void _getSpecialRecommendList()async{
    _specialRecommendResult = await getSuggestionListAPI();
    setState(() {});
  }


  // 获取热榜推荐列表
  void _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  void _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }
  // 获取推荐列表
  void _getRecommendList() async {
    _recommendList = await getRecommendListAPI({"limit": 10});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //build 里尽量不放太多代码,进一步提取方法
    return CustomScrollView(slivers:_getScrollChildern());//sliver家族的组件
  }
}
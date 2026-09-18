import 'package:flutter/material.dart';
import 'package:my_first_app/api/home.dart';
import 'package:my_first_app/components/Home/IDOCategory.dart';
import 'package:my_first_app/components/Home/IDOHot.dart';
import 'package:my_first_app/components/Home/IDOMoreList.dart';
import 'package:my_first_app/components/Home/IDOSlider.dart';
import 'package:my_first_app/components/Home/IDOSuggestion.dart';
import 'package:my_first_app/utils/ToastUtils.dart';
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

int _recommendListPage = 1; // 当前页码
bool _hasMoreData = true; // 是否还有更多数据
bool _isLoading = false; // 是否正在加载数据


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
     _registerEvent(); // 注册滚动监听事件
     /*
      创建的任务进入微任务队列，在当前帧所有渲染步骤完成后才被执行。因为渲染管线是同步执行的，
      微任务必须等渲染结束、事件循环回到队列检查时才会被调度
      相当于 iOS 控制器的 viewDidAppear 方法触发时机 （视图已完全渲染并可见）
     */
     Future.microtask((){//创建一个微任务，延迟到当前帧渲染完成后执行
        _paddingTop = 100;//偏移 触发自动下拉时
        setState(() {});
        _globalKey.currentState?.show(); // 显示刷新指示器 ，自动调用 onRefresh
     });
  }
  
    //获取轮播列表
  //async：标记为异步方法，允许内部使用 await 关键字
  Future<void> _getBannderList()async{
   _bannerList = await getBannerListAPI();
  }

  //获取分类列表
  Future<void> _getCategoryList()async{
    _categoryList = await getCategoryListAPI();
  }

  //获取特惠推荐数据
  Future<void> _getSpecialRecommendList()async{
    _specialRecommendResult = await getSuggestionListAPI();
  }


  // 获取热榜推荐列表
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
  }

  // 获取一站式推荐列表
   Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
  }
  //Future<void> 返回类型：调用者可以等待
  //只要函数里有 await，返回类型就写 Future<void>，永远不要用 void
  // 获取推荐列表
  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMoreData) {
      return; // 如果正在加载或没有更多数据，直接返回
    }
    _isLoading = true; // 标记为正在加载
    int requestLimit = _recommendListPage * 10; // 每页请求的数量
    _recommendList = await getRecommendListAPI({"limit":requestLimit});
    _isLoading = false; // 标记为加载完成
    setState(() {});
    if (_recommendList.length < requestLimit) {
      _hasMoreData = false; // 如果返回的数据少于请求的数量，说明没有更多数据
      return;
    }
    _recommendListPage++; // 增加页码
  }

  //监听滚动到底部的事件
void _registerEvent() {
  _scrollController.addListener(() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50) {
      // 当滚动到接近底部时，加载更多数据
      _getRecommendList();
    }
  });
}

 //下拉刷新
  Future<void> _onRefresh() async {
    // 重置状态
    _recommendListPage = 1;
    _hasMoreData = true;
    _isLoading = false;
    // 重新获取数据
    //只要函数里有 await，返回类型就写 Future<void>，永远不要用 void
    //轮播列表
    await _getBannderList();
    //分类列表
    await _getCategoryList();
    //特惠推荐列表
    await _getSpecialRecommendList();
    // 获取热榜推荐列表
    await _getInVogueList();
     // 获取一站式推荐列表
    await _getOneStopList();
     // 获取推荐列表
    await _getRecommendList();
    //数据获取成功 刷新成功了 
     ToastUtils.showToast(context,"刷新成功了");
    _paddingTop = 0;
    setState(() {});//刷新页面

  }

  //声明滚动容器
  final ScrollController _scrollController = ScrollController();

  // GlobalKey是一个方法可以创建一个key绑定到Widget部件上 可以操作Widget部件
  final GlobalKey<RefreshIndicatorState> _globalKey = GlobalKey<RefreshIndicatorState>();

  double _paddingTop = 0;//偏移 触发自动下拉时 

  @override
  Widget build(BuildContext context) {
    //build 里尽量不放太多代码,进一步提取方法
    //RefreshIndicator 和 CustomScrollView 这两个组件是 Flutter 中实现下拉刷新 + 复杂滚动布局的黄金搭档。
    //简单来说，CustomScrollView 负责搭建复杂的滚动页面结构，而 RefreshIndicator 负责给这个页面添加下拉刷新的交互能力
     return RefreshIndicator(
          key: _globalKey,
          onRefresh:_onRefresh,//下拉刷新回调
          //AnimatedContainer 是 Flutter 中最常用的隐式动画组件，它继承自 Container，但增加了自动动画过渡能力
          //用作下拉刷新的过度动画
          child: AnimatedContainer(
            padding: EdgeInsets.only(top: _paddingTop),//下拉偏移
            duration: Duration(milliseconds: 300),
            child: CustomScrollView(
              controller: _scrollController,//滚动控制器 定义控制器绑定组件
              slivers:_getScrollChildern()
            ),
          ),
         
        );
    }


     /*
    //build 里尽量不放太多代码,进一步提取方法
    return CustomScrollView(
      controller: _scrollController,//滚动控制器 定义控制器绑定组件
      slivers:_getScrollChildern()
      );//sliver家族的组件
   */
}
import 'package:flutter/material.dart';
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

 final List<BannerItem> _bannerList = [
  BannerItem(
    id: "1", 
    imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg"
    ),
  BannerItem(
    id: "2", 
    imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png"
    ),
  BannerItem(
    id: "3", 
    imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg"
    ),
];

  //https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png
  // https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg

//获取滚动容器的内容
List<Widget>  _getScrollChildern(){
  //包裹普通widget的sliver家族的组件
  return [
    //轮播图组件包裹普通widget,这里IDOSlider尽量不参与sliver家族 只做普通widget显示
     SliverToBoxAdapter(child:IDOSlider(bannerList: _bannerList)),//这里用到了父传子
    //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),
    //放置分类这里需要横行排列 SliverGrid SliverList只能纵向排列
     SliverToBoxAdapter(child: IDOCategory()),
     //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),
     //特惠推荐
     SliverToBoxAdapter(child: IDOSuggestion()),
      //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),

     //爆款推荐
     SliverToBoxAdapter(
        child:Padding(//内边距组件
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,//横向
            children: [
              Expanded(child: IDOHot()),//均分剩余空间
              SizedBox(width: 10),
              Expanded(child: IDOHot()),//均分剩余空间
            ],
          ),
        )
      ),
       //间隔
     SliverToBoxAdapter(child: SizedBox(height: 10)),
     //更多列表
     IDOMoreList()

    ];
}
  
  @override
  Widget build(BuildContext context) {
    //build 里尽量不放太多代码,进一步提取方法
    return CustomScrollView(slivers:_getScrollChildern());//sliver家族的组件
  }
}
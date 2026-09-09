import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/viewmodels/home.dart';

class IDOSlider extends StatefulWidget {
  
  final List<BannerItem> bannerList;//用到了 父传子，对方方法接收，在下面的对内方法渲染
  const IDOSlider({super.key, required this.bannerList});

  @override
  State<IDOSlider> createState() => _IDOSliderState();
}

class _IDOSliderState extends State<IDOSlider> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _getNetWork();

  }
  void _getNetWork(){
      Dio().get("https://geek.itheima.net/v1_0/channels").then((res){
        print("网络请求:$res");
      }).catchError((error){});
  }

   CarouselSliderController _controller =
      CarouselSliderController(); // 控制轮播图跳转的控制器
  int _currentIndex = 0; 
      //滚动轮播部件
  Widget _getSlider(){
    //在flutter获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width;
    //返回第三方 轮播图组件
    //根据数据渲染不同的轮播图选项
    return CarouselSlider(
      carouselController: _controller, //绑定controller对象
      items:List.generate(widget.bannerList.length, (int index){
      return Image.network(
        widget.bannerList[index].imgUrl,////父传子对内方法用 widget. 获取
        fit: BoxFit.cover,//图片平铺
        width: screenWidth,//屏幕宽度
        );
    }), options: CarouselOptions(
        viewportFraction: 1.0,//视口比例默认0.8
        autoPlay: true,//自动轮播
        height: 300,//轮播图高度
        //  autoPlayInterval: Duration(seconds: 1),//轮播时间间隔
        onPageChanged: (index, reason) {//监听当前滚动的角标
          _currentIndex = index;
          setState(() { });//刷新
        },
    )
    );
  }
    //返回搜索框部件
    Widget _getSearch(){
      //Positioned组件是 Stack的黄金搭档，对子组件进行精确定位控制。Positioned必须作为 Stack的直接子组件。
    // Positioned通过left、right、top、bottom 来将子组件“钉”在 Stack的某个角落或边缘
      return Positioned(
        top: 10,
        left: 0,
        right: 0,
        child: 
        Padding(//内边距组件 
            //给被包裹的子组件的四周（上、下、左、右）各留出 10 像素的空白间距。
            padding: EdgeInsets.all(10),
            child:Container(
              alignment: Alignment.centerLeft,
              //设置水平方向（左右）的内边距为 40，垂直方向（上下）保持为 0。
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: 50,//不需要写 width，它会自动撑满 Stack 的宽度，必须明确指定高度
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.4),//设置带透明的背景
                borderRadius: BorderRadius.circular(25),//将组件的四个角都设置为半径为 25 的圆角
              ),
              child: Text("搜索...",style: TextStyle(color: Colors.white,fontSize: 20)),

              ),
          )
        );
    }

    //返回指示灯导航部件
    Widget _getDots(){
      return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
          child: SizedBox(
          height: 30,
          width: double.infinity,//让该组件在宽度上尽可能大，尝试占满父组件提供的最大剩余空间
          child: Row(//横向布局
            mainAxisAlignment: MainAxisAlignment.center,// 主轴居中
            children:List.generate(widget.bannerList.length, (int index){//动态生成一个列表
            //（手势检测器）是用于识别和处理用户手势交互的核心非可视化组件
              return GestureDetector(
                onTap: () { //触发点击时的逻辑
                  _controller.jumpToPage(index);
                },
                child: AnimatedContainer( //隐式动画组件 过度动画
                    duration: Duration(milliseconds: 300),
                    height: 6,
                    width: index == _currentIndex ? 40 : 20,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: index == _currentIndex
                          ? Colors.white
                          : Color.fromRGBO(0, 0, 0, 0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
              );
            }),
            ),
          ),
      );
    }
  @override
  Widget build(BuildContext context) {

     return Stack(//堆叠组件 用于 (轮播图 索索框 轮播指示灯)等的堆叠
        children: [_getSlider(),_getSearch(),_getDots()],

     );

    // return Container(
    //   alignment: Alignment.center,
    //   color: Colors.blue,
    //   height: 300,
    //   child: Text("轮播图",style: TextStyle(color: Colors.white,fontSize: 20)),
    // );
  }
}
import 'package:flutter/material.dart';
import 'package:my_first_app/api/mine.dart';
import 'package:my_first_app/components/Home/IDOMoreList.dart';
import 'package:my_first_app/components/Mine/IDOGuess.dart';
import 'package:my_first_app/viewmodels/home.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  State<MineView> createState() => _MineViewState();
}
class _MineViewState extends State<MineView> {
//Mine 头部
  Widget _buildHead(){
    return Container(
      //上到下的线性渐变背景色
      decoration:BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,// 渐变起点：顶部中间
          end: Alignment.bottomCenter,// 渐变终点：底部中间
          colors:[const Color(0xFFFFF2E8),const Color(0xFFFDF6F1)],
          ),
      ),
          //const 变量的值必须在代码编译阶段就完全确定，不能依赖运行时才能计算的结果
          //设置非对称的内边距
      padding: const EdgeInsets.only(left: 20,top: 80,right: 20,bottom: 20),
        child: Row(//水平布局
          children: [
            // Flutter 内置的圆形头像组件，专门用于显示用户头像、商品缩略图等圆形图片场景，
            CircleAvatar(
              radius: 26,
              backgroundImage: const AssetImage('lib/assets/goods_avatar.png'),
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(//右侧：占满剩余空间
              child: Column(//垂直排列
                crossAxisAlignment: CrossAxisAlignment.start,//垂直左对齐
                children: [
                  Text( '立即登录',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                ],
              ),
              ),
          ],
        ),


    );
  }

  //VIP 提示
  Widget _buildVipCard(){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),// 外层：左右各 20 像素边距
        child:Container(
          // 内层：四周各 12 像素内边距
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),  
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 197, 153),  // 橙色背景
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),     // 左上角圆角 10
            topRight: Radius.circular(10),    // 右上角圆角 10
          ),
        ),
        child: Row(
          children: [
            Image.asset("lib/assets/ic_user_vip.png",width: 30,height: 30),
            SizedBox(width: 10),
            Expanded(//让文案区域占满图标和按钮之间的剩余空间
              child: Text( '升级美荟商城会员，尊享无限免邮',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(128, 44, 26, 1),
                  ),
                )
            ),
            TextButton(
            onPressed: (){}, 
            child: Text('立即开通', style: TextStyle(fontSize: 12)),
            ), 
          ],
        ),
      ),
    );
  }

  //"快速操作"功能模块
  Widget _buildQuickActions() {
    //局部函数 item — 快捷入口组件
      Widget item(String pic, String label) {
        return Column(
          //让 Column 的高度包裹内容，而不是撑满父容器。默认值是 max，会让 Column 尽可能占满垂直空间，导致布局异常
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        );
      }
      //外层 Padding
      return Padding(
        //卡片距离屏幕左右边缘各 10 像素。
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            //3 个入口均分排列
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              item("lib/assets/ic_user_collect.png", '我的收藏'),
              item("lib/assets/ic_user_history.png", '我的足迹'),
              item("lib/assets/ic_user_unevaluated.png", '我的客服'),
            ],
          ),
        ),
      );
    }

  //"我的订单"功能模块
  Widget _buildOrderModule() {
      //局部函数，定义在 _buildOrderModule 内部，专门用于创建单个订单状态入口
      //参数：pic（图标路径）、label（文字标签）
      Widget orderItem(String pic, String label) {
        return Column(//垂直排列图标和文字
          //让 Column 的高度尽可能小，只包裹内容，避免撑满父容器
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        );
      }
      //外层 Padding
      return Padding(
        //卡片距离屏幕左右边缘各 16 像素，上下各 10 像素。
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        //带阴影的卡片
        // card组件有默认外边距（margin），默认值为 EdgeInsets.all(4.0)
        child: Card(
          //圆角 12 像素
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,//设置阴影高度为 2，产生轻微的浮起效果
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            //卡片内部内容与边缘的间距，左右 12、上下 14
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '我的订单',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Row(
                  //订单入口均分排列
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    orderItem("lib/assets/ic_user_order.png", '全部订单'),
                    orderItem("lib/assets/ic_user_obligation.png", '待付款'),
                    orderItem("lib/assets/ic_user_unreceived.png", '待发货'),
                    orderItem("lib/assets/ic_user_unshipped.png", '待收货'),
                    orderItem("lib/assets/ic_user_unevaluated.png", '待评价'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }


    List <GoodDetailItem>_list = [];
  // 分页的请求参数
    Map<String, dynamic> _params = {"page": 1, "pageSize": 10};   
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _getGuessList();
      _registerEvent();
    }
    void _registerEvent() {
      _controller.addListener(() {
        // 监听滚动事件
        if (_controller.position.pixels >= _controller.position.maxScrollExtent - 50) {
          // 滑动到底部，距离底部 100 像素时触发加载更多
          _getGuessList();
        }
      });
    }
    // 阀门控制
    bool _isLoading = false; // 是否有人正在加载
    bool _harMore = true; // 是否还有下一页
    void _getGuessList() async {
      if (_isLoading || !_harMore) {
        // 有人正在加载 或者没有下一页就不请求了
        return;
      }
      _isLoading = true;
      final res = await getGuessListAPI(_params);
      _isLoading = false;
      _list.addAll(res.items); // 把内容追加到尾部
      // _list = res.items; // 这里不能赋值
      setState(() {});
      if (_params["page"] >= res.pages) {
        _harMore = false; // 已经没有下一页了
        return;
      }
      // 数据一共有多少页 50页
      _params["page"]++; // 针对页码进行++
    }
   

   final ScrollController _controller = ScrollController();


    @override
    Widget build(BuildContext context) {
      //CustomScrollView 纵向（默认）
      return CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(child: _buildHead()),
          SliverToBoxAdapter(child: _buildVipCard()),
          SliverToBoxAdapter(child: _buildQuickActions()),
          SliverToBoxAdapter(child: _buildOrderModule()),
          //猜你喜欢
          // pinned 表示吸住的意思
          SliverPersistentHeader(delegate: IDOGuess(), pinned: true),
          IDOMoreList(recommendList: _list),//猜你喜欢列表
        ],

      );
    }
}

/**
 * CustomScrollView 本身不直接放普通 Widget，而是接收一个 slivers 列表，里面放的都是 Sliver 系列的"滚动切片"组件
 * SliverToBoxAdapter 是 Flutter 中用于将普通的 Box 组件（如 Container、Text、Column 等）包装成 Sliver 组件的适配器，
 * 核心作用是让普通 Widget 能够放入 CustomScrollView 的 slivers 列表中使用
 *  
 * 
 * 
 * */ 
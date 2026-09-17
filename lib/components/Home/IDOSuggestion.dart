import 'package:flutter/material.dart';
import 'package:my_first_app/viewmodels/home.dart';

class IDOSuggestion extends StatefulWidget {

//特惠推荐
  final SpecialRecommendResult specialRecommendResult;

  const IDOSuggestion({super.key, required this.specialRecommendResult});

  @override
  State<IDOSuggestion> createState() => _IDOSuggestionState();
}

class _IDOSuggestionState extends State<IDOSuggestion> {

    // 取前3条数据
  List<GoodsItem> _getDisplayItems() {
    if (widget.specialRecommendResult.subTypes.isEmpty) return [];
    return widget.specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

   Widget _buildHeader(){
    return Row(
       children: [
        Text("特惠推荐",
          style: TextStyle(
          color: Color.fromARGB(255, 86, 24, 20),
          fontSize: 18,
          fontWeight:FontWeight.w700,//字体粗细（字重）
          )
        ),
        SizedBox(width: 10),
        Text(
            "精选省攻略",
            style: TextStyle(
              fontSize: 12,
              color: const Color.fromARGB(255, 124, 63, 58),
            ),
          ),
       ],
    );
   }

   Widget _buildLeft(){
    return Container(
      width: 100,
      height: 140,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover)
      ),
    );
   }

   List<Widget>_getChildrenList(){
      List<GoodsItem> list = _getDisplayItems();// 取到前3条数据
      return List.generate(list.length, (int index){
       return Expanded(
         child: Column(
          children: [
             // ClipRRect 可以包裹子元素 裁剪图片设置圆角
             ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                errorBuilder: (context, error, stackTrace) {
                  //返回一个新的部件替换原有图片
                  //Image.asset() 和 AssetImage() 的核心区别在于：前者是 Widget，后者是 ImageProvider(图片提供者)
                  return Image.asset(
                    "lib/assets/home_cmd_inner.png",
                    height: 140,
                    fit: BoxFit.cover,
                  );
                },
                list[index].picture,
                height: 140,
                fit: BoxFit.cover,
              ),
             ),
             SizedBox(height: 10),
             Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 240, 96, 12),
              ),
              child: Text(
                "¥${list[index].price}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
         )
       );
        
      });
   }

  //完成渲染
  @override
  Widget build(BuildContext context) {
    return  Padding(//内边距组件
       padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          // height: 100,
          decoration:BoxDecoration(
            color: Colors.blue,
            borderRadius:BorderRadius.circular(12),
            image:DecorationImage(
              image: AssetImage("lib/assets/home_cmd_sm.png"),
              fit: BoxFit.cover,
            ),  
          ),
         child: Column( //上线布局
          children: [
             //顶部内容
            _buildHeader(),
            SizedBox(height: 10),//间隔
            Row( //左右布局
             children: [
              _buildLeft(),
              SizedBox(width: 10),//间隔
              Expanded(//让子组件在 Row、Column 或 Flex 中，强制撑满主轴方向上的剩余空间。
                child: Row(
                  //将主轴上的剩余空间完全均匀分配，让所有子组件之间、以及首尾子组件与容器边缘之间的间距完全相等
                  //Row（水平布局）：主轴是水平方向（从左到右），spaceEvenly 会让子组件在水平方向上完全均匀分布。
                  // Column（垂直布局）：主轴是垂直方向（从上到下），spaceEvenly 会让子组件在垂直方向上完全均匀分布。 
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children:_getChildrenList(),
                ),
              )
             ],
            ),
           
          ],
         ),
      
      ),
    );
   
  }
}
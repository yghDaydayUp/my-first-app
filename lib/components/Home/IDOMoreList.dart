import 'package:flutter/material.dart';
import 'package:my_first_app/viewmodels/home.dart';

class IDOMoreList extends StatefulWidget {
  //更多推荐数据
  final List<GoodDetailItem> recommendList;

  const IDOMoreList({super.key, required this.recommendList});

  @override
  State<IDOMoreList> createState() => _IDOMoreListState();
}

class _IDOMoreListState extends State<IDOMoreList> {

 Widget _getChildren(int index){
    return Container(
     child: Column(
      children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:AspectRatio(
            aspectRatio:  1.0,
            child: Image.network(
              widget.recommendList[index].picture,
             fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "lib/assets/home_cmd_inner.png",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),//仅水平方向（左 + 右）各 10px
          child: Text(
            widget.recommendList[index].name,
            maxLines: 2,//最大显示两行
            overflow: TextOverflow.ellipsis,//当文本内容超出容器宽度时，自动隐藏超出部分，并在末尾显示省略号（...）
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),

        SizedBox(height: 8),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),//仅水平方向（左 + 右）各 10px
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,//主轴两端对齐
            children: [
              // 组件的富文本构造函数，核心作用是在一段连续的文本中，
              // 让不同片段显示不同的样式（如颜色、大小、粗细、点击事件等
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "¥${widget.recommendList[index].price}",
                      style: TextStyle(
                      fontSize:20, 
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(text:" "),
                    TextSpan(
                      text: "${widget.recommendList[index].price}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,//删除线,
                        fontSize: 12, 
                        color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                "${widget.recommendList[index].payCount}人付款",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
     )
    );
  }


  @override
  Widget build(BuildContext context) {
    //必须是Sliver家族的组件
    return SliverGrid.builder(//builder按需加载
      itemCount: widget.recommendList.length,//推荐列表长度
      gridDelegate: 
      // 网格是两列
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,//列数
        mainAxisSpacing: 10,//主轴间距
        crossAxisSpacing: 10,//交叉轴间距
        childAspectRatio: 0.75,//  核心含义是：子组件的宽度 ÷ 高度 = 0.75  宽高比 3:4，竖长方形卡片
       ), 
      itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),//仅水平方向（左 + 右）各 10px
            child: _getChildren(index)
          );
       },
    );
  }
}
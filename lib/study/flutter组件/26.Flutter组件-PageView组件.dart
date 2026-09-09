import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
   const MainPage({super.key});
 
   @override
   State<MainPage> createState() => _MainPageState();
 }
 
 class _MainPageState extends State<MainPage> {
  int _curentIndex = 0;//当前活索引
  PageController _controller = PageController();
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home:Scaffold(
        appBar: AppBar(
          title: Text("首页"),//自定义滚动容器-CustomScrollView
        ),
        body: CustomScrollView(
          slivers:[
            // // 包裹普通Widget的东西
            SliverToBoxAdapter(
              child: Stack(//堆叠组件
                children: [
                   Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    height: 160,
                    child: PageView.builder(
                      controller:_controller,
                      itemBuilder: (context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text("轮播图${index +1}",style: TextStyle(color: Colors.white,fontSize: 20)
                          ),
                        );
                      },
                      itemCount: 10,
                      ),
                  ),
                  Positioned(//堆叠组件配套
                    bottom: 0,
                    left: 0,
                    right:0,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:List.generate(10, (index){
                        return GestureDetector(
                          onTap: () {
                            // _controller.jumpToPage(index);
                            _controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
                             _curentIndex =  index;
                            setState(() { });//刷新状态
                          }, 
                          child: Container(
                            width: 20,
                            height:20 ,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(color: _curentIndex == index ? Colors.red:Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                          )
                        );
                      }),
                    ),
                    
                  )
                ],
                 
              ),
             
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverPersistentHeader(
              delegate: _StickyCategory(),
              pinned: true,
              ),

              SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),
              SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(100, (index) {
                  return  GestureDetector(
                    onTap: () {
                      print("点击了第${index+1}项");
                    },
                    child:Container(
                    margin: index%2 ==0? EdgeInsets.only(left: 10) :EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    alignment: Alignment.center,
                    child: Text('列表项${index + 1}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  );
                }),
              )

              // SliverList.separated(
                //     itemCount: 100,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         height: 100,
                //         color: Colors.blue,
                //         alignment: Alignment.center,
                //         child: Text("列表项${index + 1}",
                //             style:
                //                 TextStyle(color: Colors.white, fontSize: 20)),
                //       );
                //     },
                //     separatorBuilder: (BuildContext context, int index) {
                //       return SizedBox(
                //         height: 20,
                //       );
                //     })
          ],// 切片列表
        ),
       ),
     );
   }
 }

 class _StickyCategory extends SliverPersistentHeaderDelegate{
     @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            return Container(
              width: 100,
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.blue,
              alignment: Alignment.center,
              child:Text('分类${index +1}',style: TextStyle(color: Colors.white, fontSize: 10)),
            );
          }),
    );
  }
  @override
  // TODO: implement maxExtent
  double get maxExtent => 80; // 最大展开高度

  @override
  // TODO: implement minExtent
  double get minExtent => 40; // 最小折叠高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
   return false;// 不需要重建
  }
 }


/**
 * 作用：用于组合多个可滚动组件（如列表、网格），实现统一协调的滚动效果
 * Sliver： Flutter 中描述可滚动视图内部一部分内容的组件，它是滚动视图的"切片"
 * 用法：通过 slivers属性接收一个 Sliver 组件列表
 * Siiver组件对应关系：
 * SliverList => ListView
 * SliverGrid => GridView
 * SliverAppBar => AppBar
 * SliverPadding => Padding
 * SliverToBoxAdapter => ToBoxAdapter (用于包裹普通 Widget）
 * SliverPersistentHeader(粘性吸顶)
*/

/**
 * 整页滚动容器-PageView
 * 作用：用于实现分页滚动视图的核心组件
 * 方式：提供多种构建方式，默认构造方式、PageView.builder等
 * 优势：支持懒加载（按需渲染）
*/
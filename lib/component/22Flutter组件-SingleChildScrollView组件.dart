import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget{
 @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MianPage();
  }
}

class _MianPage extends State<MainPage>{
 TextEditingController _phoneController = TextEditingController();
 TextEditingController _codeController = TextEditingController(); // 密码控制器
  ScrollController _controller = ScrollController(); //滚动条控制器
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("SingleChildScrollView代码实例",style: TextStyle(color:Colors.red,fontSize: 20)),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(//包裹一个子组件，让单个子组件具备滚动能力。
              controller: _controller,
              padding: EdgeInsets.all(20),
                child:Column(
                  children:List.generate(100, (index){
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      color: Colors.blue,
                      width: double.infinity,
                      height: 100,
                      child: Text("我是第${index +1}个",style: TextStyle(color: Colors.white,fontSize: 10),
                      ),
                    );
                  })
                ),
              ),
               // 放置堆叠组件
               
              Positioned(
                top: 10,
                right:10,
                child:GestureDetector(
                  onTap: () {
                      // print("去底部");
                        // _controller.jumpTo(
                        //     _controller.position.maxScrollExtent); // 滚动到底部
                        _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                  },

                  child:Container(
                  decoration: BoxDecoration(
                   color: Colors.red, 
                   borderRadius: BorderRadius.circular(40)
                  ),
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  child: Text("去底部",style: TextStyle(color: Colors.white),),
                ),
                )
                
               
              ),
               Positioned(
                bottom: 10,
                right:10,
                child: GestureDetector(
                  onTap: () {
                    // print("去顶部");
                    // _controller.jumpTo(0);
                    _controller.animateTo(0,
                        duration: Duration(seconds: 1),
                        curve: Curves.bounceIn);
                  },
                child: Container(
                  decoration: BoxDecoration(
                   color: Colors.red, 
                   borderRadius: BorderRadius.circular(40)
                  ),
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  child: Text("去顶部",style: TextStyle(color: Colors.white),),
                ),
                )
              ),
            ],
          )
          
        
        )
     );

  }
  
}

/**
 *
 * 子组件：只能包含一个子组件，如果滚动多个组件，通常将其嵌套在Column或Row组件中
 * 滚动方向：通过 scrollDirection属性控制，默认为垂直方向 (Axis.vertical)，也可设置为水平方向 (Axis.horizontal)
 * 特点：一次性构建所有子组件，如果嵌套的 Column或 Row中包含大量子项，可能会导致性能问题，建议使用 ListView
 *控制滚动： 绑定一个ScrollController对象给controller对象，使用animateTo/jumpTo方法控制滚动
 * 滚动到顶部： controller.jumpTo(0)
 * 滚动到底部： controller.jumpTo(controller.position.maxScrollExtent).  
*/
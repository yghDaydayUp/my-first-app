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
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
         title: "flutte初步体验",
     theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
     home: Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidget"),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            child: Text("中部区域"),
            onTap: () {
              print("点击了中部区域");
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Center(
          child: GestureDetector(
             child: Text("底部区域"),
             onTap: () {
               print("点击了底部区域");
             },
          ),
         
        ),
      ),
     ),
    );
  }
}
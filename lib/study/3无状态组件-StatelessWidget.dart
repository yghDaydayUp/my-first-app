import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: "flutte初步体验",
     theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
     home: Scaffold(
      appBar: AppBar(
        title: Text("StatelessWidget"),
      ),
      body: Container(
        child: Center(
          child: Text("中部区域"),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Center(
          child: Text("底部区域"),
        ),
      ),
     ),
     );
  }

}


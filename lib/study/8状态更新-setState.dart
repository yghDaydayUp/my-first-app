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
  int count  = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body:Center(
          child: Row(
            children: [
              TextButton(onPressed: (){
                count -=1;
                print(count);
                setState(() {
                });
              }, 
                child: Text("减")
              ),
              Text(count.toString()),
              TextButton(onPressed: (){
                count +=1;
                print(count);
                setState(() {
                });
              }, 
                child: Text("加")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
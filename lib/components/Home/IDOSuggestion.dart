import 'package:flutter/material.dart';

class IDOSuggestion extends StatefulWidget {
  const IDOSuggestion({super.key});

  @override
  State<IDOSuggestion> createState() => _IDOSuggestionState();
}

class _IDOSuggestionState extends State<IDOSuggestion> {
  @override
  Widget build(BuildContext context) {
    return  Padding(//内边距组件
       padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text("特惠推荐",style: TextStyle(color: Colors.white,fontSize: 20)),
      ),
    );
   
  }
}
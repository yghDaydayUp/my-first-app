import 'package:flutter/material.dart';

class IDOHot extends StatefulWidget {
  const IDOHot({super.key});

  @override
  State<IDOHot> createState() => _IDOHotState();
}

class _IDOHotState extends State<IDOHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text("爆款推荐",style:TextStyle(color: Colors.white,fontSize: 10)),
    );
  }
}
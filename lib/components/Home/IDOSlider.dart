import 'package:flutter/material.dart';

class IDOSlider extends StatefulWidget {
  const IDOSlider({super.key});

  @override
  State<IDOSlider> createState() => _IDOSliderState();
}

class _IDOSliderState extends State<IDOSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 300,
      child: Text("轮播图",style: TextStyle(color: Colors.white,fontSize: 20)),
    );
  }
}
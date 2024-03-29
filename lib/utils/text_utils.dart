import 'package:flutter/material.dart';
class TextUtil extends StatelessWidget {
  String text;
  Color? color;
  double? size;
  bool? weight;

  TextUtil({super.key,required this.text,this.size,this.color,this.weight,});

  @override
  Widget build(BuildContext context) {
    return  Text(text,
      maxLines: 6,
      style: TextStyle(
          color:color??Colors.white,fontSize:size?? 16,fontFamily: "Roboto",
          fontWeight:weight==null?FontWeight.normal: FontWeight.w700
      ),);
  }
}
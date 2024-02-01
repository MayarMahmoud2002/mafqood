import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {

  final double radius ;
  final double height ;
  final double width ;
  final Color? color ;
  final Gradient? gradiant;
  final String? text;
  final TextStyle? textStyle;

  ContainerWidget({required this.radius, required this.height, required this.width,  this.color, this.gradiant, this.text, this.textStyle,});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child: Text(text! , style: textStyle,)) ,
      height:height ,
      width:width,
      decoration: BoxDecoration(
        gradient: gradiant,
        color: color,
        borderRadius: BorderRadius.circular(radius)
      ),
    );
  }
}

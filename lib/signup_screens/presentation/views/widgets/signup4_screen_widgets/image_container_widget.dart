import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 180,
      width: double.infinity,
    );

  }
}

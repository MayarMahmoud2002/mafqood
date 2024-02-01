import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/images.dart';

class BottomPartWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        height: 250,
        width: double.infinity,
        child: Stack(
          children: [
            Image(
              fit: BoxFit.fill,
              image: AssetImage(Images.earthImage),
            ),
            Container(
              height: double.infinity,
              // color: Colors.yellow,
              child: Image(
                image: AssetImage(
                  Images.lightImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/assets.dart';

class BottomPartOfSplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        height: 250,
        width: double.infinity,

        child:Stack(
          children: [
            Image(
              fit: BoxFit.fill,
              image:  AssetImage(Images.earthImage),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 56.0),
              child: Container(
                child: Image(
                  image: AssetImage(
                    Images.lightImage,
                  ),
                ),
              ),
            ),


          ],

        ),
      ),
    );

  }
}

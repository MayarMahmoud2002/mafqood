import 'package:flutter/material.dart';
import 'package:mafqood/splash_screen/widgets/bottom_part_of_splash_screen.dart';
import 'package:mafqood/splash_screen/widgets/top_part_of_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),

        body: Column(
          children: [
            TopPartOfSplashScreen(),
            BottomPartOfSplashScreen(),


          ],
        ),
      ),
    );
  }
}

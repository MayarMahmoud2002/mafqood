import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/splash_screen/presentation/views/widgets/bottom_part_widget.dart';
import '../widgets/top_part_widget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ScreensColors.primaryColor,
        body: Column(
          children: [
            TopPartWidget(),
            BottomPartWidget(),
          ],
        ),
      ),
    );
  }
}

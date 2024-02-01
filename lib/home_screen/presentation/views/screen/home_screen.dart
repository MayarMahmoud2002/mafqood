import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/home_screen/presentation/views/widgets/home_screen_widgets/search_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/styles.dart';
import '../widgets/home_screen_widgets/notification_widget.dart';
import '../widgets/home_screen_widgets/post_item.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreensColors.primaryColor,

      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0, top: 40.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SearchWidget(),
                    Spacer(),
                    NotificationWidget(),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextWidget(
                  text: 'Browse',
                  textStyle: Styles.textStyle15White,
                ),
                PostItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/colors.dart';

import '../../../core/shared_widgets/text_widget.dart';
import '../../../core/utilis/styles.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.notifications_rounded,color: ScreensColors.darkGreenColor,),
              radius: 20,
              backgroundColor: ScreensColors.lightGreenColor,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(text: ' Welcome to the Notification Center!', textStyle: Styles.textStyle13White),
                Row(
                  children: [
                    TextWidget(text:' Click here to find out more.' , textStyle: Styles.textStyle13White),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 3.5,
                          backgroundColor: Color.fromRGBO(
                              0, 160, 255, 1.0),
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        TextWidget(text: '2 hours ago', textStyle: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      color: ScreensColors.primaryColor,
      width: double.infinity,
      height: 86,
    );

  }
}

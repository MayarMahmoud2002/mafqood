import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../card_for_find_and_search_person/screens/card_for_find_and_search_person.dart';
import '../widgets/notification_item_widget.dart';


class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isCardVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ScreensColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only( top: 33),
          child:Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: InkWell(
                      onTap: ()
                      {
                        setState(() {
                          isCardVisible = !isCardVisible;
                        });
                      },
                      child: BackButtonWidget(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextWidget(text: 'Notification', textStyle: Styles.textStyle25White,),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  NotificationItemWidget(),
                ],
              ),
              if (isCardVisible) CardCustom(),


            ],
          ),

        ),
      ),
    );

  }
}




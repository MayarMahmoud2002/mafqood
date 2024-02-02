import 'package:flutter/material.dart';
import 'package:mafqood/card_for_find_and_search_person/widgets/cancel_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../core/shared_widgets/text_widget.dart';
import '../../core/utilis/images.dart';
import '../widgets/find_person_button_widget.dart';
import '../widgets/search_person_button_widget.dart';

class CardCustom extends StatefulWidget {
  @override
  _CardCustomState createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  bool isCardVisible = true;

  @override
  Widget build(BuildContext context) {
    return isCardVisible
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ScreensColors.whiteColor,
                ),
                height: 500,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 19.0, top: 22.0, left: 19.0, bottom: 5.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CancelWidget(),
                          SizedBox(
                            height: 31.0,
                          ),
                          TextWidget(
                            text: 'Why you want to create post?',
                            textStyle: Styles.textStyle20Black,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextWidget(
                            text:
                                'If you find a missing person, please click Find. But if you’re looking for a missing person, click Search',
                            textStyle: Styles.textStyle13Black,
                          ),
                          SizedBox(
                            height: 31.0,
                          ),
                          Image.asset(Images.cardImage),
                          SizedBox(
                            height: 31.0,
                          ),
                          Row(
                            children: [
                              FindPersonButtonWidget(),
                              SizedBox(
                                width: 22.0,
                              ),
                              SearchPersonButtonWidget(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(); // If isCardVisible is false, don't show the card.
  }
}

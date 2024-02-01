import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';

class TitleOfScreen extends StatelessWidget {
  final String text;
  final String number;



  TitleOfScreen({required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 15.0, right: 15.0),
      child: Row(
        children: [
          TextWidget(
              text: '${text}', textStyle: Styles.textStyle25White),
          Spacer(),
          TextWidget(text: '${number}', textStyle: Styles.textStyle15White)
        ],
      ),
    );

  }
}

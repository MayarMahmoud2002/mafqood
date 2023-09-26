

import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';

class ContinueButtonWidget extends StatelessWidget {

final String text;

ContinueButtonWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(88, 45, 92, 1.0),
              Color.fromRGBO(177, 104, 79, 1.0),
            ],
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: TextWidget(
            text: text,
            textStyle: Styles.textStyle1,
          ),
        ),
        height: 55.0,
        width: double.infinity,
      ),
    );
  }
}


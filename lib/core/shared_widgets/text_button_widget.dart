import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import '../utilis/styles.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final String routeName;


  TextButtonWidget( {required this.text, required this.textStyle, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()
    {
      Navigator.pushNamed(context, routeName);

    }, child:TextWidget(text: text, textStyle: textStyle),
    );

  }
}

import 'package:flutter/material.dart';
import '../../../../core/shared_widgets/text_button_widget.dart';
import '../../../../core/utilis/styles.dart';

class LoginWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget(
      text: 'login',
      textStyle: Styles.textStyle15White,
      routeName: 'loginScreen',
    );

  }
}

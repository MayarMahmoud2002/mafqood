import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/container_line_widget.dart';
import 'package:mafqood/core/shared_widgets/container_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import '../../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../widgets/signup1_screen_widgets/body_for_signup1_screen_widget.dart';

class SignUpScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
      backgroundColor: ScreensColors.primaryColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ScreensColors.primaryColor,
            leading: Padding(
              padding: const EdgeInsets.only(top: 25.0 , left: 23),
              child: BackButtonWidget(),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),
              TitleOfScreen(
                text: 'Create New Account',
                number: '1/4',
              ),
              SizedBox(
                height: 35.0,
              ),
              ContainerLineWidget(),
              BodyForSignup1Widget(),
              Spacer(),
              ContinueButtonWidget(text: 'Continue', routeName: 'signUpScreen2', ),
            ],
          )),
    );
  }
}

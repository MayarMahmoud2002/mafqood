import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/shared_widgets/text_button_widget.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../widgets/login_body_widget.dart';

class LoginScreen extends StatelessWidget {
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
                text: 'Login',
                number: '',
              ),
              SizedBox(
                height: 35.0,
              ),
              ContainerLineWidget(),
              LoginBodyWidget(),
              Spacer(),
              ContinueButtonWidget(text: 'Continue' , routeName: 'homeScreen',),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(text: 'Don\'t have an account?', textStyle:TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ) ),
                    SizedBox(
                      width: 3.0,
                    ),
                    TextButtonWidget(text: 'Sign Up', textStyle: Styles.textStyle10Orange, routeName: 'signUpScreen1'),

                  ],
                ),
              ),
            ],
          )),
    );

  }
}

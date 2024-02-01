import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../widgets/signup3_screen_widgets/phone_field_widget.dart';

class SignUpScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ScreensColors.primaryColor,
          resizeToAvoidBottomInset: false,
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
                number: '3/4',
              ),
              SizedBox(
                height: 35.0,
              ),
              ContainerLineWidget(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Phone Number',
                      textStyle: Styles.textStyle15White,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    PhoneFieldWidget(),
                  ],
                ),
              ),
              Spacer(),
              ContinueButtonWidget(text: 'Send Code' , routeName: 'otpScreen',),
            ],
          )),
    );
  }}


import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/title.dart';
import '../../../../core/shared_widgets/container_line.dart';
import '../../../../core/shared_widgets/continue_button.dart';
import '../widgets/body_of_signup_screen4.dart';

class SignUpScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
        leading: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
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
            number: '4/4',
          ),
          SizedBox(
            height: 35.0,
          ),
          ContainerLineWidget(),
          BodyOfSignUpScreen4(),
          Spacer(),
          ContinueButtonWidget(text: 'Continue',),
        ],
      ),
    );
  }
}

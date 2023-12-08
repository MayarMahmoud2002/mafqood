
import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/container_line.dart';
import 'package:mafqood/core/shared_widgets/continue_button.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_2.dart';

import '../../../../core/shared_widgets/text_form_field.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';

class SignUpScreen1 extends StatelessWidget {
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
              number: '1/4',
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
                    text: 'Full Legal Name&National Id',
                    textStyle: Styles.textStyle1,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormFieldWidget(
                    text: 'Enter Your Full Name',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text, hidePassword: false, color: Colors.white, heightOfTextFormField: 50.0,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormFieldWidget(
                    text: 'Enter Your National Id',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number, hidePassword: false, color: Colors.white, heightOfTextFormField: 50.0,
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SignUpScreen2()),
                  );

                },
                child: ContinueButtonWidget(text: 'Continue')),
          ],
        ));
  }
}

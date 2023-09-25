import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_form_field.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_3.dart';
import 'package:mafqood/signup_screen/presentation/views/widgets/app_par_widget.dart';

import '../../../../core/shared_widgets/container_line.dart';
import '../../../../core/shared_widgets/title.dart';

class SignUpScreen2 extends StatelessWidget {

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
              number: '2/4',
            ),
            SizedBox(
              height: 35.0,
            ),
            ContainerLineWidget(),
            // SignUpScreen2(),
            // SignUpScreen1(),
            // Padding(
            //   padding:
            //   const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       TextWidget(
            //         text: 'Full Legal Name&National Id',
            //         textStyle: Styles.textStyle1,
            //       ),
            //       SizedBox(
            //         height: 40.0,
            //       ),
            //       TextFormFieldWidget(
            //         text: 'Enter Your Full Name',
            //         textInputAction: TextInputAction.next,
            //         textInputType: TextInputType.text,
            //       ),
            //       SizedBox(
            //         height: 25.0,
            //       ),
            //       TextFormFieldWidget(
            //         text: 'Enter Your National Id',
            //         textInputAction: TextInputAction.done,
            //         textInputType: TextInputType.number,
            //       ),
            //     ],
            //   ),
            // )
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: 'Password', textStyle: Styles.textStyle1,),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormFieldWidget(text: 'Enter Your Password',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text, hidePassword: true,),
                  SizedBox(
                    height: 25.0,
                  ),

                  TextFormFieldWidget(
                    text: 'Confirm your password',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text, hidePassword: true,),


                ],
              ),
            ),


            Spacer(),
            Padding(
              padding:
              const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
              child: GestureDetector(
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SignUpScreen3()),
                  );

                },
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
                      text: 'Continue',
                      textStyle: Styles.textStyle1,
                    ),
                  ),
                  height: 55.0,
                  width: double.infinity,
                ),
              ),
            ),

            // ContinueButtonWidget(),

            // TextFor
            // mFieldOfSignUp(),
            // Spacer(),
            // ContinueButtonWidget(),
          ],
        ));

  }
}

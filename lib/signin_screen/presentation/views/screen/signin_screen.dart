import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_form_field.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import 'package:mafqood/home_screen/presentation/views/screen/home_screen.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_3.dart';
import '../../../../core/shared_widgets/container_line.dart';
import '../../../../core/shared_widgets/continue_button.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../signup_screen/presentation/views/screens/sign_up_screen_1.dart';
import '../../../../splash_screen/splash_screen.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25.0 , left: 23),
            child: InkWell(
              onTap: ()
              {
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    width: 0.5,
                    color: Color.fromRGBO(109, 102, 114, 1.0),
                  ),
                ),
                height: 33,
                width: 33,
              ),
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
              text: 'Login',
              number: '',
            ),
            SizedBox(
              height: 35.0,
            ),
            ContainerLineWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: 'Full Name & password', textStyle: Styles.textStyle1,),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormFieldWidget(text: 'Enter Your Full Name',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text, hidePassword: true, color: Colors.white, heightOfTextFormField: 50.0,),
                  SizedBox(
                    height: 25.0,
                  ),



                  TextFormFieldWidget(
                    text: 'Enter your password',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text, hidePassword: true, color: Colors.white, heightOfTextFormField: 50.0,),


                ],
              ),
            ),
            Spacer(),
            InkWell(
                onTap: ()
                {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomeScreen()),);

                },
                child: ContinueButtonWidget(text: 'Continue')),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
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
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SplashScreen()),);
                    },
                    child: TextWidget(text: 'Sign Up', textStyle:TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(232, 161, 110, 1.0),
                    ) ),
                  ),

                ],
              ),
            ),


          ],
        ));

  }
}

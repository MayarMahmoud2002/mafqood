




import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:mafqood/core/shared_widgets/container_line.dart';
import 'package:mafqood/core/shared_widgets/continue_button.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_2.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_3.dart';

import '../../../../core/shared_widgets/text_form_field.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../home_screen/presentation/views/screen/home_screen.dart';
import '../../../../splash_screen/splash_screen.dart';

class OtpScreen extends StatelessWidget {

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SplashScreen()),);
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
                    text: 'Enter Code',
                    textStyle: Styles.textStyle1,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Center(
                        child: Container(
                          width: 54, // Set the desired width
                          height: 54, // Set the desired height
                          child: TextFormField(

                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '',
                              labelText: '',
                              labelStyle: TextStyle(
                                fontSize: 11.0,
                                color: Color.fromRGBO(109, 102, 114, 1.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: GradientOutlineInputBorder(
                                  gradient: LinearGradient(colors: [     Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Container(
                          width: 54, // Set the desired width
                          height: 54, // Set the desired height
                          child: TextFormField(

                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '',
                              labelText: '',
                              labelStyle: TextStyle(
                                fontSize: 11.0,
                                color: Color.fromRGBO(109, 102, 114, 1.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: GradientOutlineInputBorder(
                                  gradient: LinearGradient(colors: [     Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Container(
                          width: 54, // Set the desired width
                          height: 54, // Set the desired height
                          child: TextFormField(

                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '',
                              labelText: '',
                              labelStyle: TextStyle(
                                fontSize: 11.0,
                                color: Color.fromRGBO(109, 102, 114, 1.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: GradientOutlineInputBorder(
                                  gradient: LinearGradient(colors: [     Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: Container(
                          width: 54, // Set the desired width
                          height: 54, // Set the desired height
                          child: TextFormField(

                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.done,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '',
                              labelText: '',
                              labelStyle: TextStyle(
                                fontSize: 11.0,
                                color: Color.fromRGBO(109, 102, 114, 1.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(109, 102, 114, 1.0),
                                  )
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(109, 102, 114, 1.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: GradientOutlineInputBorder(
                                  gradient: LinearGradient(colors: [     Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen3()),);
                    },
                    child: TextWidget(
                        text: 'Edit Phone number ?', textStyle: Styles.textStyle8),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextWidget(
                      text: 'Resend code via SMS', textStyle: Styles.textStyle8),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextWidget(text: 'Resend code via Voice call',
                      textStyle: Styles.textStyle8),
                ],
              ),
            ),
            Spacer(),
            InkWell(
                onTap: ()
                {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomeScreen()),
                  );

                },
                child: ContinueButtonWidget(text: 'Continue')),
          ],
        ));
  }
}



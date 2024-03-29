import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:mafqood/authentication_bloc/authentication_bloc.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/shared_widgets/container_line_widget.dart';
import 'package:mafqood/core/shared_widgets/container_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';

import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../home_screen/presentation/views/screen/main_screen.dart';
import '../../../../../splash_screen/presentation/views/screens/splash_screen.dart';
import '../signup3_screen/sign_up_screen_3.dart';
import '../signup5_screen/sign_up_screen_5.dart';

class OtpScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController checkOtp1Controller = TextEditingController();
  final TextEditingController checkOtp2Controller = TextEditingController();
  final TextEditingController checkOtp3Controller = TextEditingController();
  final TextEditingController checkOtp4Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading)
        {
          return CircularProgressIndicator();
        }else if (state is AuthenticationSuccess)
        {
          Navigator.pushNamed(context, 'mainScreen');
        }else if (state is AuthenticationFailure)
        {
          return Text('Authentication Failure ${state.error}');
        }
        return Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: ScreensColors.primaryColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: ScreensColors.primaryColor,
              leading: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 23),
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
                  number: '',
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
                        textStyle: Styles.textStyle15White,
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
                                controller: checkOtp1Controller,
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(109, 102, 114, 1.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: GradientOutlineInputBorder(
                                      gradient: LinearGradient(colors: [
                                    Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])),
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
                                controller: checkOtp2Controller,
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(109, 102, 114, 1.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: GradientOutlineInputBorder(
                                      gradient: LinearGradient(colors: [
                                    Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])),
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
                                controller: checkOtp3Controller,
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(109, 102, 114, 1.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: GradientOutlineInputBorder(
                                      gradient: LinearGradient(colors: [
                                    Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])),
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
                                controller: checkOtp4Controller,
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
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
                                        color:
                                            Color.fromRGBO(109, 102, 114, 1.0),
                                      )),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(109, 102, 114, 1.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: GradientOutlineInputBorder(
                                      gradient: LinearGradient(colors: [
                                    Color.fromRGBO(177, 104, 79, 1.0),
                                    Color.fromRGBO(88, 45, 92, 1.0),
                                  ])),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen5()),
                          );
                        },
                        child: TextWidget(
                            text: 'Edit Phone number ?',
                            textStyle: Styles.textStyle8White),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextWidget(
                          text: 'Resend code via SMS',
                          textStyle: Styles.textStyle8White),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextWidget(
                          text: 'Resend code via Voice call',
                          textStyle: Styles.textStyle8White),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: ()
                  {
                    var authBloc = BlocProvider.of<AuthenticationBloc>(context);
                    authBloc.add(
                      CheckOTPEvent(otp: checkOtp1Controller.text,
                      ),);

                    authBloc.add(
                      CheckOTPEvent(otp: checkOtp2Controller.text,
                      ),);

                    authBloc.add(
                      CheckOTPEvent(otp: checkOtp3Controller.text,
                      ),);

                    authBloc.add(
                      CheckOTPEvent(otp: checkOtp4Controller.text,
                      ),);
                  },
                  child: ContinueButtonWidget(
                    text: 'Continue',
                    // routeName: 'mainScreen',
                  ),
                ),
              ],
            ));
      },
    );
  }
}


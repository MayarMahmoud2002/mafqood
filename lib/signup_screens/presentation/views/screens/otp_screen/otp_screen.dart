import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:mafqood/authentication_bloc/authentication_bloc.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/shared_widgets/container_line_widget.dart';
import 'package:mafqood/core/shared_widgets/container_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/core/utilis/navigation_service.dart';
import 'package:mafqood/signup_screens/presentation/views/screens/otp_screen/otp_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/shared_widgets/flush_bar.dart';
import '../../../../../core/shared_widgets/pin.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';
import '../../../../../forget_password_screen/new_password_screen.dart';
import '../../../../../home_screen/presentation/views/screen/main_screen.dart';
import '../../../../../splash_screen/presentation/views/screens/splash_screen.dart';
import '../signup3_screen/sign_up_screen_3.dart';
import '../signup5_screen/sign_up_screen_5.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({ this.phone="",this.resetPassword=false});
  String phone="";
  bool resetPassword=false;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<OTPProvider>(context, listen: false).startTimer();

}

  @override
  void deactivate(){
    Provider.of<OTPProvider>(context, listen: false).disposeTimer();
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is VerifyOTPLoading) {
          EasyLoading.show(status: 'loading...');
        }
        else if (state is VerifyOTPFailure) {
          showFlushBar(state.error);
          EasyLoading.dismiss();
        } else if (state is VerifyOTPSuccess) {
          EasyLoading.dismiss();

          if (widget.resetPassword)
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewPasswordScreen(phone:widget.phone)));
          else
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
          showFlushBar("OTP verified successfully",isError: false);
        }
      },
      builder: (context, state) {
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
                      Center(
                          child: Pin(
                            onComplete: (pin) {
                              var authBloc = BlocProvider.of<AuthenticationBloc>(context);
                              authBloc.add(
                                CheckOTPEvent(otp: pin,
                                ),);
                            },
                            controller: Provider.of<OTPProvider>(context).pinController,
                          )),
                      SizedBox(
                        height: 15.0,
                      ),
                      Center(
                          child:TextWidget(
                              text: "The code will expire in "+
                                  Provider.of<OTPProvider>(context).myDuration.inSeconds.toString() + " seconds",
                              textStyle: Styles.textStyle10White)

                      ),
                      SizedBox(
                        height: 45.0,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: TextWidget(
                                text: 'Edit Phone number ?',
                                textStyle: Styles.textStyle10White),
                          ),
                          Opacity(
                            opacity: Provider.of<OTPProvider>(context).myDuration.inSeconds == 0?1:0.5,
                            child: InkWell(
                              onTap: () {
                                Provider.of<OTPProvider>(context,listen: false).resendTimer();
                                var authBloc = BlocProvider.of<AuthenticationBloc>(context);
                                authBloc.add(
                                  GenerateOTPEvent(
                                    phone: widget.phone,
                                  ),
                                );
                              },
                              child: TextWidget(
                                  text: 'Resend code via SMS',
                                  textStyle: Styles.textStyle10White),
                            ),
                          ),
                        ],
                      ),


                      // SizedBox(
                      //   height: 15.0,
                      // ),
                      // TextWidget(
                      //     text: 'Resend code via Voice call',
                      //     textStyle: Styles.textStyle10White),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ));
      },
    );
  }
}


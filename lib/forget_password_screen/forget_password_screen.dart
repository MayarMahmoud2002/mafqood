import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:provider/provider.dart';
import '../../../../authentication_bloc/authentication_bloc.dart';
import '../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../core/shared_widgets/text_button_widget.dart';
import '../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';
import '../core/shared_widgets/flush_bar.dart';
import '../signup_screens/presentation/views/screens/otp_screen/otp_provider.dart';
import '../signup_screens/presentation/views/screens/otp_screen/otp_screen.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
PhoneNumber? phoneNumber;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is GenerateOTPLoading) {
          EasyLoading.show(status: 'loading...');
        }else if (state is GenerateOTPSuccess) {
          EasyLoading.dismiss();
          Provider.of<OTPProvider>(context, listen: false).init();
          Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(
            phone: phoneNumber!.countryCode+phoneNumber!.number,
            resetPassword: true,
          )));
        } else if (state is GenerateOTPFailure){
          showFlushBar(state.error);
          print ("error in generate otp");
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key:_scaffoldKey,
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
                  text: 'Forget Password',
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
                      TextWidget(
                        text: 'Phone Number',
                        textStyle: Styles.textStyle15White,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      IntlPhoneField(
                        controller: phoneController,
                        pickerDialogStyle: PickerDialogStyle(
                          searchFieldCursorColor: Colors.black87,
                        ),
                        autofocus: true,
                        dropdownTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Enter your Phone Number',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(109, 102, 114, 1.0),
                              fontSize: 12.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
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
                              )),
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
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(177, 104, 79, 1.0),
                                Color.fromRGBO(88, 45, 92, 1.0),
                              ])),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          setState(() {
                            phoneNumber=  PhoneNumber(
                              countryCode: phone.countryCode,
                              number: phone.number,
                              countryISOCode: phone.countryISOCode,
                            );
                          });
                        },
                      ),
                      // PhoneFieldWidget(),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    var authBloc=
                    BlocProvider.of<AuthenticationBloc>(context);
                    authBloc.add(
                      GenerateOTPEvent(
                        phone: phoneNumber!.countryCode+phoneNumber!.number,
                      ),
                    );
                  },
                  child: ContinueButtonWidget(
                    text: 'Continue',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



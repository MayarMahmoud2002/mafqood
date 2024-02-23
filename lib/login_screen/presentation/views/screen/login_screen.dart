import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mafqood/core/utilis/colors.dart';
import '../../../../authentication_bloc/authentication_bloc.dart';
import '../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../core/shared_widgets/flush_bar.dart';
import '../../../../core/shared_widgets/text_button_widget.dart';
import '../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneNumber? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          EasyLoading.show(status: 'loading...');
        } else if (state is SignInSuccess) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, 'mainScreen');
          showFlushBar('Login Successfully', isError: false);
        } else if (state is SignInFailure) {
          showFlushBar(state.error);
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
            body: Form(
              key: _formKey,
              child: Column(
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
                      left: 15.0,
                      right: 15.0,
                      top: 35.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Phone & password',
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
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormFieldWidget(
                          text: 'Enter your password',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          hidePassword: true,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextButtonWidget(
                          text: 'Forgot Password?',
                          textStyle: Styles.textStyle10Orange,
                          routeName: 'forgotPasswordScreen',
                        ),


                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      var authBloc = BlocProvider.of<AuthenticationBloc>(context);
                      authBloc.add(
                        SignInEvent(
                          phone: phoneNumber!.countryCode+phoneNumber!.number,
                          password: passwordController.text,
                        ),
                      );
                                    },
                    child: ContinueButtonWidget(
                      text: 'Continue',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Don\'t have an account?',
                          textStyle: Styles.textStyle10White,
                        ),
                        SizedBox(
                          width: 3.0,
                        ),
                        TextButtonWidget(
                          text: 'Sign Up',
                          textStyle: Styles.textStyle10Orange,
                          routeName: 'signUpScreen1',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



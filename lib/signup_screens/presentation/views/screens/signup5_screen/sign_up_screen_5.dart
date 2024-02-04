import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mafqood/authentication_bloc/authentication_bloc.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../../core/shared_widgets/title.dart';

class SignUpScreen5 extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationLoading)
            {
              return CircularProgressIndicator();
            }else if (state is AuthenticationSuccess)
            {
              Navigator.pushNamed(context, 'otpScreen');
            }
            return SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: ScreensColors.primaryColor,
                  resizeToAvoidBottomInset: false,
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
                        number: '5/5',
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
                                print(phone.completeNumber);
                              },
                            ),
                            // PhoneFieldWidget(),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          var authBloc =
                          BlocProvider.of<AuthenticationBloc>(context);
                          authBloc.add(
                            GenerateOTPEvent(
                              phone: phoneController.text,
                            ),
                          );
                        },
                        child: ContinueButtonWidget(text: 'Send Code'),
                      ),
                    ],
                  )),
            );
          },
        );
      },
    );
  }
}

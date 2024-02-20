import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mafqood/authentication_bloc/authentication_bloc.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import '../../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../../core/shared_widgets/flush_bar.dart';
import '../../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';

class SignUpScreen2 extends StatefulWidget {
  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RegisterLocationLoading) {
          EasyLoading.show(status: 'loading...');
        }
        else if (state is RegisterLocationFailure) {
          showFlushBar(state.error);
          EasyLoading.dismiss();
        } else if (state is RegisterLocationSuccess) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, 'signUpScreen3');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
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
                    number: '2/5',
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
                          text: 'country & City & State',
                          textStyle: Styles.textStyle15White,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormFieldWidget(
                          controller: countryController,
                          text: 'Enter Your Country',
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                          hidePassword: false,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormFieldWidget(
                          controller: cityController,
                          text: 'Confirm your City',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          hidePassword: false,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormFieldWidget(
                          controller: stateController,
                          text: 'Confirm your State',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          hidePassword: false,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      var authBloc =
                          BlocProvider.of<AuthenticationBloc>(context);
                      authBloc.add(
                        RegisterLocationEvent(
                            country: countryController.text,
                            state: stateController.text,
                            city: cityController.text),
                      );
                    },
                    child: ContinueButtonWidget(
                      text: 'Continue',
                      // routeName: 'signUpScreen3',
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}

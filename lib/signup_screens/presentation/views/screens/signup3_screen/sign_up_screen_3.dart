import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/authentication_bloc/authentication_bloc.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import '../../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';

class SignUpScreen3 extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return CircularProgressIndicator();
        } else if (state is AuthenticationSuccess) {
          Navigator.pushNamed(context, 'otpScreen');
        } else if (state is AuthenticationFailure) {
          return Text('Authentication failed: ${state.error}');
        }
        String? imagePath;

        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: ScreensColors.primaryColor,

            // appBar: AppBar(
            //   elevation: 0.0,
            //   backgroundColor: ScreensColors.primaryColor,
            //   leading: Padding(
            //     padding: const EdgeInsets.only(top: 25.0 , left: 23),
            //     child: BackButtonWidget(),
            //   ),
            // ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 23),
                    child: BackButtonWidget(),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TitleOfScreen(
                    text: 'Create New Account',
                    number: '3/5',
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
                          text: 'personal Image & Gender',
                          textStyle: Styles.textStyle15White,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormFieldWidget(
                          controller: genderController,
                          text: 'Enter Your Gender (Male or Female)',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          hidePassword: false,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Take a personal photo',
                                textStyle: Styles.textStyle15White,
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  height: 180,
                                  width: double.infinity,
                                 ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Expanded(child: ContinueButtonWidget(text: 'Camera',)),
                                  SizedBox(width: 5,),
                                  Expanded(child: ContinueButtonWidget(text: 'Gallery',)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // BodyForSignup3ScreenWidget(),
                  SizedBox(
                    height: 35.0,
                  ),
                  InkWell(
                    onTap: () {
                      var authBloc =
                          BlocProvider.of<AuthenticationBloc>(context);
                      authBloc.add(
                        RegisterGenderAndImageProfileEvent(
                            imageProfile: imagePath.toString(),
                            gender: genderController.text),
                      );
                    },
                    child: ContinueButtonWidget(
                      text: 'Continue',
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


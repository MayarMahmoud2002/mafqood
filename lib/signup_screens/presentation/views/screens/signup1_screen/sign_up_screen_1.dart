import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/shared_widgets/container_line_widget.dart';
import 'package:mafqood/core/shared_widgets/container_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import '../../../../../authentication_bloc/authentication_bloc.dart';
import '../../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';

class SignUpScreen1 extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading)
        {
          return CircularProgressIndicator();
        }else if (state is AuthenticationSuccess)
        {
          Navigator.pushNamed(context, 'signUpScreen2');
        } else if (state is AuthenticationFailure)
        {
          return Text('Authentication failed: ${state.error}');
        }
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
                    number: '1/5',
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
                          text: 'Full Legal Name & Password',
                          textStyle: Styles.textStyle15White,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormFieldWidget(
                          controller:nameController ,
                          text: 'Enter Your Full Name',
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
                          controller: passwordController,
                          text: 'Enter Your Password',
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                          hidePassword: true,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormFieldWidget(
                          controller:resetPasswordController,
                          text: 'Confirm your password',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          hidePassword: true,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                        ),
                      ],
                    ),
                  ),
                  // BodyForSignup1Widget(),
                  Spacer(),
                  InkWell(
                    onTap: ()
                    {
                      var authBloc = BlocProvider.of<AuthenticationBloc>(context);
                      authBloc.add(
                        RegisterNamePasswordEvent(
                          password: passwordController.text,
                          name: nameController.text,
                        ),);
                      authBloc.add(
                        RegisterResetPasswordEvent(
                          password: resetPasswordController.text,
                        ),
                      );
                    },
                    child: ContinueButtonWidget(
                      text: 'Continue',
                      // routeName: 'signUpScreen2',
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication_bloc/authentication_bloc.dart';
import '../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../core/shared_widgets/text_button_widget.dart';
import '../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return CircularProgressIndicator();
        } else if (state is AuthenticationSuccess) {
          Navigator.pushNamed(context, 'mainScreen');
        } else if (state is AuthenticationFailure) {
          return Text('Authentication failed: ${state.error}');
        }
        return Column(
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
                  TextFormFieldWidget(
                    text: 'Enter Your Phone',
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
                    text: 'Enter your password',
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    hidePassword: true,
                    color: Colors.white,
                    heightOfTextFormField: 50.0,
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  SignInEvent(
                    phone: 'Phone',
                    password: 'Password',
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
        );
      },
    );
  }
}

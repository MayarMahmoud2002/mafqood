import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/utilis/colors.dart';
import '../../../../authentication_bloc/authentication_bloc.dart';
import '../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../core/shared_widgets/text_button_widget.dart';
import '../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        return SafeArea(
          child: Scaffold(
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
                        controller: phoneController,

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
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    var authBloc = BlocProvider.of<AuthenticationBloc>(context);
                    authBloc.add(
                      SignInEvent(
                        phone: phoneController.text,
                        password: passwordController.text,
                      ),
                    );
                                  },
                  child: ContinueButtonWidget(
                    text: 'Continue',
                  ),
                ),



                // InkWell(
                //   onTap: () {
                //     BlocProvider.of<AuthenticationBloc>(context).add(
                //       SignInEvent(
                //         phone: 'Phone',
                //         password: 'Password',
                //       ),
                //     );
                //   },
                //   child: ContinueButtonWidget(
                //     text: 'Continue',
                //   ),
                // ),
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
        );
      },
    );
  }
}



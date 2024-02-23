import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
import '../core/shared_widgets/flush_bar.dart';

class NewPasswordScreen extends StatefulWidget {
  String phone;
  NewPasswordScreen({required this.phone});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController newPasswordConfirmController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is UpdatePasswordLoading) {
           EasyLoading.show(status: 'loading...');
        } else if (state is UpdatePasswordSuccess) {
           EasyLoading.dismiss();
          Navigator.pushNamed(context, 'loginScreen');
          showFlushBar('Password Updated Successfully',isError: false);
        } else if (state is UpdatePasswordFailure) {
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
                    text: 'Set New Password',
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

                        TextFormFieldWidget(
                          controller: newPasswordController,
                          text: 'Enter Your Password',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          hidePassword: true,
                          color: Colors.white,
                          heightOfTextFormField: 50.0,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormFieldWidget(
                          controller:newPasswordConfirmController,
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
                  Spacer(),
                  InkWell(
                    onTap: () {
                      var authBloc=
                      BlocProvider.of<AuthenticationBloc>(context);
                      authBloc.add(
                        UpdatePasswordEvent(
                          phone: widget.phone,
                          newPassword: newPasswordController.text,
                          confirmPassword: newPasswordConfirmController.text,
                        ),
                      );
                    },
                    child: ContinueButtonWidget(
                      text: 'Update Password',
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




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
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
import '../signup4_screen/front_of_id_screen.dart';

class SignUpScreen3 extends StatefulWidget {
  @override
  State<SignUpScreen3> createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController genderController = TextEditingController();
  String imagePath="";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RegisterGenderAndImageProfileLoading) {
          EasyLoading.show(status: 'loading...');
        }
        else if (state is RegisterGenderAndImageProfileFailure) {
          showFlushBar(state.error);
          EasyLoading.dismiss();
        } else if (state is RegisterGenderAndImageProfileSuccess) {
          EasyLoading.dismiss();
          Navigator.push(context, MaterialPageRoute(builder: (context) => IdImagesScreen()));
        }
      },
      builder: (context, state) {



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
                          text: 'Enter Your Gender (male or female)',
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
                                    image:imagePath.isNotEmpty? DecorationImage(
                                      image: FileImage(File(imagePath)),
                                      fit: BoxFit.cover,
                                    ):null,
                                  ),
                                  height: 180,
                                  width: double.infinity,
                                 ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child:
                                      ContinueButtonWidget(text: 'Camera',
                                      onTap: () async {
                                        final picker = ImagePicker();
                                        final pickedFile = await picker.pickImage(source: ImageSource.camera);
                                        setState(() {
                                          if (pickedFile != null) {
                                            imagePath = pickedFile.path;
                                          } else {
                                            print('No image selected.');
                                          }
                                        });
                                      },
                                      )),
                                  SizedBox(width: 5,),
                                  Expanded(child: ContinueButtonWidget(text: 'Gallery',
                                  onTap: () async {
                                    final picker = ImagePicker();
                                    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      if (pickedFile != null) {
                                        imagePath = pickedFile.path;
                                      } else {
                                        print('No image selected.');
                                      }
                                    });
                                  },
                                  )),
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


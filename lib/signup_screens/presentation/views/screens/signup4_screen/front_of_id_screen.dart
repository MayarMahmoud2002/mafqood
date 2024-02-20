import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/authentication_bloc/authentication_bloc.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/signup_screens/presentation/views/widgets/signup4_screen_widgets/image_container_widget.dart';
import '../../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../../core/shared_widgets/flush_bar.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';

class IdImagesScreen extends StatefulWidget {
  @override
  State<IdImagesScreen> createState() => _IdImagesScreenState();
}

class _IdImagesScreenState extends State<IdImagesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String idFrontImagePath = "";
  String idBackImagePath = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RegisterIdImagesLoading) {
          EasyLoading.show(status: 'loading...');
        }
        else if (state is RegisterIdImagesFailure) {
          showFlushBar(state.error);
          EasyLoading.dismiss();
        } else if (state is RegisterIdImagesSuccess) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, 'signUpScreen5');
        }
      },
      builder: (context, state) {
        return Scaffold(
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                TitleOfScreen(
                  text: 'Create New Account',
                  number: '4/5',
                ),
                SizedBox(
                  height: 35.0,
                ),
                ContainerLineWidget(),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Take a photo of your front of id',
                        textStyle: Styles.textStyle15White,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image:idFrontImagePath.isNotEmpty? DecorationImage(
                            image: FileImage(File(idFrontImagePath)) as ImageProvider,
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
                          Expanded(child: ContinueButtonWidget(text: 'Camera',
                            onTap: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.camera);
                              setState(() {
                                if (pickedFile != null) {
                                  idFrontImagePath = pickedFile.path;
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
                                  idFrontImagePath = pickedFile.path;
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
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Take a photo of your back of id',
                        textStyle: Styles.textStyle15White,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image:idBackImagePath.isNotEmpty? DecorationImage(
                            image: FileImage(File(idBackImagePath)) as ImageProvider,
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
                          Expanded(child: ContinueButtonWidget(text: 'Camera',
                            onTap: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.camera);
                              setState(() {
                                if (pickedFile != null) {
                                  idBackImagePath = pickedFile.path;
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
                                  idBackImagePath = pickedFile.path;
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
                SizedBox(
                  height: 35.0,
                ),
                InkWell(
                    onTap: ()
                    {
                      var authBloc =
                      BlocProvider.of<AuthenticationBloc>(context);
                      authBloc.add(
                        RegisterIdImagesEvent(nationalIdFrontImage: idFrontImagePath, nationalIdBackImage: idBackImagePath),
                      );

                    },
                    child: ContinueButtonWidget(text: 'Next',)),
              ],
            ),
          ),
        );
      },
    );
  }
}

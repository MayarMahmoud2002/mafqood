import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/authentication_bloc/authentication_bloc.dart';
import 'package:mafqood/core/shared_widgets/back_button_widget.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/signup_screens/presentation/views/widgets/signup4_screen_widgets/image_container_widget.dart';
import '../../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';

class IdImagesScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController idFrontImageController = TextEditingController();
  final TextEditingController idBackImageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading)
          {
            return CircularProgressIndicator();
          }else if (state is AuthenticationSuccess)
          {
            Navigator.pushNamed(context, 'signUpScreen5');
          }else if (state is AuthenticationFailure)
          {
            return Text('Authentication failed: ${state.error}');

          }
        return Scaffold(
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
                      ImageContainerWidget(),
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
                      ImageContainerWidget(),
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
                        RegisterIdImagesEvent(nationalIdFrontImage: idFrontImageController.toString(), nationalIdBackImage: idBackImageController.toString()),
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

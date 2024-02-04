import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/colors.dart';
import '../../../../../core/shared_widgets/back_button_widget.dart';
import '../../../../../core/shared_widgets/container_line_widget.dart';
import '../../../../../core/shared_widgets/container_button_widget.dart';
import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/shared_widgets/title.dart';
import '../../../../../core/utilis/styles.dart';
import '../../widgets/signup4_screen_widgets/image_container_widget.dart';

class BackOfIdScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
              text: 'Create New Account',
              number: '',
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
                    text: 'Take a photo of your Back of id',
                    textStyle: Styles.textStyle15White,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  ImageContainerWidget(),
                ],
              ),
            ),
            Spacer(),
            ContinueButtonWidget(text: 'Continue', routeName: 'signUpScreen5',)
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mafqood/signup_screens/presentation/views/widgets/signup4_screen_widgets/image_container_widget.dart';

import '../../../../../../core/shared_widgets/text_form_field_widget.dart';
import '../../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../../core/utilis/styles.dart';

class BodyForSignup5ScreenWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: 'personal Image & Gender', textStyle: Styles.textStyle15White,),
          SizedBox(
            height: 40.0,
          ),
          TextFormFieldWidget(text: 'Enter Your Gender (Male or Female)',
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.text, hidePassword: false, color: Colors.white, heightOfTextFormField: 50.0,),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
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
                ImageContainerWidget(),
              ],
            ),
          ),




        ],
      ),
    );

  }
}

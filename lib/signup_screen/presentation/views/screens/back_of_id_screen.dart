import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/container_line.dart';
import '../../../../core/shared_widgets/continue_button.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';

class BackOfIdScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
        leading: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
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
            number: '4/4',
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
                  textStyle: Styles.textStyle1,
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





              ],
            ),
          ),
          Spacer(),
          ContinueButtonWidget(text: 'Take a Photo',)




        ],
      ),



    );
  }
}

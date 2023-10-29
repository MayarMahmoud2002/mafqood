import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/container_line.dart';
import '../../../../core/shared_widgets/continue_button.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/shared_widgets/title.dart';
import '../../../../core/utilis/styles.dart';
import '../../../../home_screen/presentation/views/screen/home_screen.dart';

class OTPScreen extends StatelessWidget {
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
            text: 'Create new account',
            number: '3/4',
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
                  text: 'Enter Code',
                  textStyle: Styles.textStyle1,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 75,
                      width: 65.0,
                      decoration: BoxDecoration(
                        color: Colors.white12,

                        borderRadius: BorderRadius.circular(15.0),

                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 75,
                      width: 65.0,
                      decoration: BoxDecoration(
                        color: Colors.white12,

                        borderRadius: BorderRadius.circular(15.0),

                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 75,
                      width: 65.0,
                      decoration: BoxDecoration(
                        color: Colors.white12,

                        borderRadius: BorderRadius.circular(15.0),

                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 75,
                      width: 65.0,
                      decoration: BoxDecoration(
                        color: Colors.white12,

                        borderRadius: BorderRadius.circular(15.0),

                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextWidget(
                    text: 'Edit Phone number ?', textStyle: Styles.textStyle1),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(
                    text: 'Resend code via SMS', textStyle: Styles.textStyle1),
                SizedBox(
                  height: 15.0,
                ),
                TextWidget(text: 'Resend code via Voice call',
                    textStyle: Styles.textStyle1),
                SizedBox(
                  height: 70.0,
                ),
                GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeScreen()),
                      );
                    },
                    child: ContinueButtonWidget(text: 'Continue')),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

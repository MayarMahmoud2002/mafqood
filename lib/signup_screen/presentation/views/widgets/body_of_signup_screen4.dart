import 'package:flutter/material.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/back_of_id_screen.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/front_of_id_screen.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/personal_photo_screen.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/styles.dart';
import 'container_for_signup4.dart';

class BodyOfSignUpScreen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: 'Supporting Documents',
            textStyle: Styles.textStyle1,
          ),
          SizedBox(
            height: 40.0,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  FrontOfIdScreen()),
                );

              },
              child: ContainerForSignUp4(
                ContainerText: 'Proof of your front of id',
              )),
          SizedBox(
            height: 17.0,
          ),
          InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  BackOfIdScreen()),
                );

              },
              child: ContainerForSignUp4(
                ContainerText: 'Proof of your back of id',
              )),
          SizedBox(
            height: 17.0,
          ),
          InkWell(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  PersonalPhotoScreen()),
                );

              },
              child: ContainerForSignUp4(
                ContainerText: 'Proof a personal photo',
              )),
        ],
      ),
    );

  }
}

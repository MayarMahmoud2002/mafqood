import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/container_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';

import '../../../../signup_screens/presentation/views/screens/signup1_screen/sign_up_screen_1.dart';

class SignupWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SignUpScreen1()),);
      },
      child: ContainerWidget(radius: 35.0, height: 38.0, width: 90.0,text:'Sign Up' , textStyle: Styles.textStyle15White, gradiant: LinearGradient(colors: [
        Color.fromRGBO(88, 45, 92, 1.0),
        Color.fromRGBO(177, 104, 79, 1.0),
      ]),),
    );

  }
}


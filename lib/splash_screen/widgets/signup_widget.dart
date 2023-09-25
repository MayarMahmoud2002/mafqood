import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_1.dart';

import '../../signup_screen/presentation/views/screens/signup_screen.dart';

class SignupWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(88, 45, 92, 1.0),
                Color.fromRGBO(177, 104, 79, 1.0),
              ]
          ),
          color: Colors.white,

          borderRadius: BorderRadius.circular(35.0)
      ),
      child: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SignUpScreen1()),
            );
          },
          child: TextWidget(text: 'Sign up', textStyle: Styles.textStyle1,

          ),
        ),
      ),
      height: 38.0,
      width: 90,
    );

  }
}


import 'package:flutter/material.dart';

import '../../splash_screen/presentation/views/screens/splash_screen.dart';

class BackButtonWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  SplashScreen()),);
      },
      child: Container(
        child: Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            width: 0.5,
            color: Color.fromRGBO(109, 102, 114, 1.0),
          ),
        ),
        height: 33,
        width: 33,
      ),
    );
  }
}

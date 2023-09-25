import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import 'package:mafqood/splash_screen/widgets/signup_widget.dart';


class TopPartOfSplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextWidget(
                    text: 'With Mafqood App we are find your missing child ', textStyle: Styles.textStyle2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Row(
                      children: [
                        SignupWidget(),
                        SizedBox(
                          width: 10.0,
                        ),
                        TextButton(onPressed: (){}, child:TextWidget(text: 'Login', textStyle: Styles.textStyle1,),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );

  }
}

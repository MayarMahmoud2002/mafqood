import 'package:flutter/material.dart';
import 'package:mafqood/splash_screen/presentation/views/widgets/signup_widget.dart';
import 'package:mafqood/splash_screen/presentation/views/widgets/title_widget.dart';
import 'login_widget.dart';

class TopPartWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TitleWidget(),
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Row(
                        children: [
                          SignupWidget(),
                          SizedBox(
                            width: 10.0,
                          ),
                          LoginWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

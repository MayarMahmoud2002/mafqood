import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';

class ContinueButtonWidget extends StatelessWidget {
final String text;
final String? routeName;
Function()? onTap;

ContinueButtonWidget({required this.text, this.routeName, this.onTap });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
      child: InkWell(
        onTap: routeName != null
            ? () {
          Navigator.pushNamed(context, routeName!);
        }
            : onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(88, 45, 92, 1.0),
                Color.fromRGBO(177, 104, 79, 1.0),
              ],
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Center(
            child: TextWidget(
              text: text,
              textStyle: Styles.textStyle15White,
            ),
          ),
          height: 48.0,
          width: double.infinity,
        ),
      ),
    );
  }
}


//on InkWell
// onTap: routeName != null
//     ? () {
//   Navigator.pushNamed(context, routeName!);
// }
//     : null,

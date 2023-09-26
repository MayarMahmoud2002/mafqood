import 'package:flutter/material.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/styles.dart';
class ContainerForSignUp4 extends StatelessWidget {
  final String ContainerText;
  ContainerForSignUp4({required this.ContainerText});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            TextWidget(text:ContainerText, textStyle: Styles.textStyle1),
            Spacer(),
            Icon(Icons.arrow_forward_sharp , color: Colors.white,),
          ],
        ),
      ),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromRGBO(55, 29, 58, 1.0),
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../../../../core/shared_widgets/text_form_field_widget.dart';
// import '../../../../../core/shared_widgets/text_widget.dart';
// import '../../../../../core/utilis/styles.dart';
//
// class BodyForSignup1Widget extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding:
//       const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextWidget(
//             text: 'Full Legal Name & Password',
//             textStyle: Styles.textStyle15White,
//           ),
//           SizedBox(
//             height: 40.0,
//           ),
//           TextFormFieldWidget(
//             text: 'Enter Your Full Name',
//             textInputAction: TextInputAction.next,
//             textInputType: TextInputType.text, hidePassword: false, color: Colors.white, heightOfTextFormField: 50.0,),
//           SizedBox(
//             height: 25.0,
//           ),
//           TextFormFieldWidget(text: 'Enter Your Password',
//             textInputAction: TextInputAction.next,
//             textInputType: TextInputType.text, hidePassword: true, color: Colors.white, heightOfTextFormField: 50.0,),
//           SizedBox(
//             height: 25.0,
//           ),
//           TextFormFieldWidget(
//             text: 'Confirm your password',
//             textInputAction: TextInputAction.done,
//             textInputType: TextInputType.text, hidePassword: true, color: Colors.white, heightOfTextFormField: 50.0,),
//         ],
//       ),
//     );
//
//   }
// }

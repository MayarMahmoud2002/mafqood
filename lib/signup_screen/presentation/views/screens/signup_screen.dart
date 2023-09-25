// import 'package:flutter/material.dart';
// import 'package:mafqood/core/shared_widgets/container_line.dart';
// import 'package:mafqood/core/shared_widgets/continue_button.dart';
// import 'package:mafqood/core/shared_widgets/text_form_field.dart';
// import 'package:mafqood/core/shared_widgets/text_widget.dart';
// import 'package:mafqood/core/shared_widgets/title.dart';
// import 'package:mafqood/core/utilis/styles.dart';
// import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_1.dart';
// import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_2.dart';
// import 'package:mafqood/signup_screen/presentation/views/screens/sign_up_screen_3.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//         backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
//
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
//           leading: Padding(
//             padding: const EdgeInsets.only(top: 25.0),
//             child: IconButton( onPressed: () {  }, icon: Icon(Icons.arrow_back_ios ),
//               color: Colors.white,
//             ),
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 30.0,
//             ),
//             TitleOfScreen(text: 'Create New Account', number: '1/4',),
//             SizedBox(
//               height: 35.0,
//             ),
//             ContainerLineWidget(),
//             // SignUpScreen2(),
//             // SignUpScreen1(),
//             Spacer(),
//             ContinueButtonWidget(),
//
//
//
//             // TextFor
//             // mFieldOfSignUp(),
//             // Spacer(),
//             // ContinueButtonWidget(),
//           ],
//         )
//
//     );
//   }
// }

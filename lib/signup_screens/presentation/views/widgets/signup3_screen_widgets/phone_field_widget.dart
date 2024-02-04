// import 'package:flutter/material.dart';
// import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
// import 'package:intl_phone_field/country_picker_dialog.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// class PhoneFieldWidget extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return  IntlPhoneField(
//       pickerDialogStyle: PickerDialogStyle(
//         searchFieldCursorColor: Colors.black87,
//       ),
//       autofocus: true,
//       dropdownTextStyle: TextStyle(
//         color: Colors.white,
//       ),
//       cursorColor: Colors.white,
//       style: TextStyle(
//         color: Colors.white,
//       ),
//       decoration: InputDecoration(
//         labelText: 'Enter your Phone Number',
//         labelStyle: TextStyle(
//             color: Color.fromRGBO(109, 102, 114, 1.0),
//             fontSize: 12.0),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide(
//             color: Color.fromRGBO(109, 102, 114, 1.0),
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(
//               color: Color.fromRGBO(109, 102, 114, 1.0),
//             )),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide(
//             color: Color.fromRGBO(109, 102, 114, 1.0),
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(color: Colors.red)),
//         focusedBorder: GradientOutlineInputBorder(
//             gradient: LinearGradient(colors: [
//               Color.fromRGBO(177, 104, 79, 1.0),
//               Color.fromRGBO(88, 45, 92, 1.0),
//             ])),
//       ),
//       initialCountryCode: 'IN',
//       onChanged: (phone) {
//         print(phone.completeNumber);
//       },
//     );
//
//   }
// }

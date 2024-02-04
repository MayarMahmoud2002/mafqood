import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String text;
  final TextInputAction textInputAction;
  final TextInputType textInputType ;
  final bool hidePassword;
  final Color color;
  final double? heightOfTextFormField;
  final TextEditingController? controller;

  TextFormFieldWidget({ required this.text, required this.textInputAction, required this.textInputType, required this.hidePassword, required this.color,  this.heightOfTextFormField, this.controller,});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: heightOfTextFormField,
      child: TextFormField(
        controller: controller,
        obscureText: hidePassword,
        style: TextStyle(
          color: color,
        ),
        textInputAction: textInputAction,
        cursorColor: color,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: '${text}',
          labelStyle: TextStyle(
            fontSize: 11.0,
            color: Color.fromRGBO(109, 102, 114, 1.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(109, 102, 114, 1.0),
              )),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(109, 102, 114, 1.0),
            ),

          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color.fromRGBO(109, 102, 114, 1.0),
              )
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(109, 102, 114, 1.0),
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: GradientOutlineInputBorder(
      gradient: LinearGradient(colors: [     Color.fromRGBO(177, 104, 79, 1.0),
        Color.fromRGBO(88, 45, 92, 1.0),
      ])
      ),
        ),
      ),
    );
  }
}


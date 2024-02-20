
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/app_contances.dart';

import '../utilis/navigation_service.dart';




showFlushBar(
  String title, {
  bool isError = true,
}) {
  Flushbar(
    message: title,
    messageText: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 16),
      textAlign: TextAlign.center,
    ),
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    backgroundColor: isError? Colors.red:Colors.green,
    shouldIconPulse: false,
    boxShadows: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 2),
      ),
    ],
    icon: isError
        ? Icon(
            Icons.error,
            color: Colors.white,
            size: 20,
          )
        : Icon(
            Icons.check,
            color: Colors.white,
            size: 20,
          ),
    duration: Duration(seconds: 3),
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(20),
    maxWidth: AppConstances().size.width * 70 / 100,
  )..show(NavigationService.context!);
}

import 'dart:async';

import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier{
  TextEditingController pinController = TextEditingController();
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);
  init (){
    myDuration = Duration(minutes: 1);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
  startTimer() async {
    countdownTimer =
        await Timer.periodic(Duration(seconds: 1), (_) {
      final reduceSecondsBy = 1;
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
        notifyListeners();
      }
    });
  }
  disposeTimer() {
    countdownTimer!.cancel();
  }
  resendTimer() async {
    pinController.clear();
    countdownTimer!.cancel();
    myDuration = Duration(minutes: 1);
    notifyListeners();
    countdownTimer =
        await    Timer.periodic(Duration(seconds: 1), (_) {
      final reduceSecondsBy = 1;
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        notifyListeners();
      } else {
        myDuration = Duration(seconds: seconds);
        notifyListeners();
      }
    });
  }

}
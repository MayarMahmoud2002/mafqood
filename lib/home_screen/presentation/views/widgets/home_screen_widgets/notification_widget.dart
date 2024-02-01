import 'package:flutter/material.dart';
import '../../../../../notification_screen/views/screens/notification_screen.dart';

class NotificationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationScreen()),
        );
      },
      child: Container(
        child: Icon(
          Icons.notifications_active_outlined,
          color: Colors.white,
        ),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(55.0),
          border: Border.all(color: Colors.white30),
        ),
      ),
    );
  }
}

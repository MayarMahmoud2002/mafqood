import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
      leading: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
    );
  }
}

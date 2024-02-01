import 'package:flutter/material.dart';

class ContainerLineWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(88, 45, 92, 1.0),
              Color.fromRGBO(177, 104, 79, 1.0),
            ]),
      ),
    );

  }
}

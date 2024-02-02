import 'package:flutter/material.dart';

class CancelWidget extends StatefulWidget {

  @override
  State<CancelWidget> createState() => _CancelWidgetState();
}

class _CancelWidgetState extends State<CancelWidget> {
  bool isCardVisible = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isCardVisible = false;
            });
          },
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close_sharp,
              size: 35.0,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );

  }
}

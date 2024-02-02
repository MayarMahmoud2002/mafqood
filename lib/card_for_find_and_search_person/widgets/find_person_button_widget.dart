import 'package:flutter/material.dart';

import '../../addPost_screen/views/screens/find_post_screen.dart';
import '../../core/shared_widgets/text_widget.dart';

class FindPersonButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FindPostScreen()),
        );
      },
      child: Container(
        child: Center(
          child: TextWidget(
            text: 'Find a person',
            textStyle: TextStyle(
              fontSize: 15.0,
              color:
              Color.fromRGBO(255, 255, 255, 1.0),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(47, 27, 58, 1.0),
          borderRadius: BorderRadius.circular(6.0),
        ),
        height: 48.0,
        width: 142,
      ),
    );

  }
}

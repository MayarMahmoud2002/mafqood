import 'package:flutter/material.dart';
import '../../addPost_screen/views/screens/lost_post_screen.dart';
import '../../core/shared_widgets/text_widget.dart';
import '../../core/utilis/styles.dart';

class SearchPersonButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LostPostScreen()),
          );
        },
        child: Container(
          child: Center(
            child: TextWidget(
              text: 'Search for a person',
              textStyle: Styles.textStyle13Black,
            ),
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1.0),
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
                color: Color.fromRGBO(
                    217, 217, 217, 1.0)),
          ),
          height: 48.0,
          // Adjust width as needed
        ),
      ),
    );
  }
}

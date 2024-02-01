import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/text_widget.dart';
import '../../../../../core/utilis/styles.dart';

class PostItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    'assets/images/humanphoto.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                height: 40,
                width: 40.0,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Mayar Mahmoud',
                    textStyle: Styles.textStyle15White,
                  ),
                  Text(
                    '1h',
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Text(
          'I found This child, he is from cairo,Egypt.\nhis name is Ali ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '...see more',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/images/missedchild1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 180,
          width: double.infinity,
        ),

      ],
    );
  }
}

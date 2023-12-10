import 'package:flutter/material.dart';

import '../../addPost_screen/views/screens/find_post_screen.dart';
import '../../addPost_screen/views/screens/lost_post_screen.dart';
import '../../core/shared_widgets/text_widget.dart';

class CardCustom extends StatefulWidget {
  @override
  _CardCustomState createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  bool isCardVisible = true;

  @override
  Widget build(BuildContext context) {
    return isCardVisible
        ? Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color.fromRGBO(255, 255, 255, 1.0),
          ),
          height: 500,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 19.0, top: 22.0, left: 19.0, bottom: 5.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isCardVisible = false;
                            });
                          },
                          child: Icon(
                            Icons.close_sharp,
                            size: 35.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 31.0,
                    ),
                    TextWidget(
                      text: 'Why you want to create post?',
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextWidget(
                      text:
                      'If you find a missing person, please click Find. But if you’re looking for a missing person, click Search',
                      textStyle: TextStyle(
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      height: 31.0,
                    ),
                    Image.asset('assets/images/cardImage.png'),
                    SizedBox(
                      height: 31.0,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: ()
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  FindPostScreen()),);
                          },
                          child: Container(
                            child: Center(
                              child: TextWidget(
                                text: 'Find a person',
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
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
                        ),
                        SizedBox(
                          width: 22.0,
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: ()
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  LostPostScreen()),);
                            },
                            child: Container(
                              child: Center(
                                child: TextWidget(
                                  text: 'Search for a person',
                                  textStyle: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                    color: Color.fromRGBO(217, 217, 217, 1.0)),
                              ),
                              height: 48.0,
                              // Adjust width as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : Container(); // If isCardVisible is false, don't show the card.
  }
}

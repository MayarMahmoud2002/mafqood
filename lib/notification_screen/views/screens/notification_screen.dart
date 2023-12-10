import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/core/utilis/styles.dart';
import '../../../card_for_find_and_search_person/screens/card_for_find_and_search_person.dart';


class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isCardVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
        body: Padding(
          padding: const EdgeInsets.only( top: 33),
          child:Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: InkWell(
                      onTap: ()
                      {
                        setState(() {
                          isCardVisible = !isCardVisible;

                        });



                      },
                      child: Container(
                        child: Icon(Icons.arrow_back_sharp,color: Colors.white,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        height: 35,
                        width: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextWidget(text: 'Notification', textStyle: Styles.textStyle2,),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.notifications_rounded,color: Color.fromRGBO(0, 172, 92, 1.0),),
                            radius: 20,
                            backgroundColor: Color.fromRGBO(223, 248, 186, 1.0),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(text: ' Welcome to the Notification Center!', textStyle: Styles.textStyle4),
                              Row(
                                children: [
                                  TextWidget(text:' Click here to find out more.' , textStyle: Styles.textStyle4),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3.5,
                                       backgroundColor: Color.fromRGBO(
                                           0, 160, 255, 1.0),
                                      ),
                                      SizedBox(
                                        width: 3.0,
                                      ),
                                      TextWidget(text: '2 hours ago', textStyle: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.white,
                                      )),
                                    ],
                                  ),
                                ],
                              ),



                            ],
                          ),

                        ],
                      ),
                    ),
                    color: Color.fromRGBO(40, 25, 49, 1.0),
                    width: double.infinity,
                    height: 86,
                  ),


                ],
              ),
              if (isCardVisible) CardCustom(),


            ],
          ),

        ),
      ),
    );

  }
}




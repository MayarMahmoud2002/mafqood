
import 'package:flutter/material.dart';
import 'package:mafqood/core/shared_widgets/text_widget.dart';
import 'package:mafqood/notification_screen/views/screens/notification_screen.dart';

import '../../../../core/utilis/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color primaryColor = Color.fromRGBO(24, 13, 31, 1.0);
  int _currentIndex = 0; // Index of the selected tab

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(24, 13, 31, 1.0), // Set the background color here
        //   leading: InkWell(
        //     onTap: () {},
        //     child: Container(
        //       child: Icon(
        //         Icons.search,
        //         color: Colors.white,
        //       ),
        //       height: 35,
        //       width: 35,
        //       decoration: BoxDecoration(
        //         // color: Colors.yellow,
        //         borderRadius: BorderRadius.circular(55.0),
        //         border: Border.all(color: Colors.white30),
        //       ),
        //     ),
        //   ),
        //   title:                         InkWell(
        //     onTap: () {},
        //     child: Container(
        //       child: Icon(
        //         Icons.notifications_active_outlined,
        //         color: Colors.white,
        //       ),
        //       height: 35,
        //       width: 35,
        //       decoration: BoxDecoration(
        //         // color: Colors.yellow,
        //         borderRadius: BorderRadius.circular(55.0),
        //         border: Border.all(color: Colors.white30),
        //       ),
        //     ),
        //   ),
        //
        //
        // ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0, top: 40.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: Icon(
                            Icons.search,
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
                      ),
                      Spacer(),
                      InkWell(
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextWidget(
                    text: 'Browse',
                    textStyle: Styles.textStyle1,
                  ),
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
                              textStyle: Styles.textStyle1,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Icon(
                              Icons.local_hospital_outlined,
                              color: Colors.red,
                            ),
                            //Image.asset(
                            //                             'assets/images/humanphoto.jpg',
                            //                             fit: BoxFit.cover,
                            //                           ),
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
                              text: 'Damerdash Hospital',
                              textStyle: Styles.textStyle1,
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
                    'we found This man,in cairo,Egypt. ',
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
                        'assets/images/manmissed.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: 180,
                    width: double.infinity,
                  ),
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
                              textStyle: Styles.textStyle1,
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
                    'I found This child, she is from cairo,Egypt. ',
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
                        'assets/images/34702-اطغال.jpg',
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
                              textStyle: Styles.textStyle1,
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
                    'I found This man, he is from cairo,Egypt.\nhis name is mohamed ',
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
                        'assets/images/oldermanmissed.png',
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
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Color.fromRGBO(24, 13, 31, 1.0), // Set the background color here
          selectedItemColor: Color.fromRGBO(224, 136, 72, 1.0), // Set the selected item color
          unselectedItemColor: Color.fromRGBO(159, 159, 159, 1.0), // Set the unselected item color
          type: BottomNavigationBarType.fixed, // Set the type to fixed
          iconSize: 20,
          selectedLabelStyle: TextStyle(fontSize: 10.0),
          unselectedLabelStyle: TextStyle(fontSize: 10.0),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined),
              label: 'Add post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}


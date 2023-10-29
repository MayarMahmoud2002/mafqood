import 'package:flutter/material.dart';
import '../../../../core/shared_widgets/text_widget.dart';
import '../../../../core/utilis/styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: SingleChildScrollView(
          child: Column(
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
                    onTap: () {},
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
        ),
      ),
          //    bottomNavigationBar:BottomNavigationBar(
          // // backgroundColor: Color.fromRGBO(24, 13, 31, 1.0),
          //   backgroundColor: Colors.amber,
          //
          //   items:
          //   [
          //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined,
          //       color: Colors.amber,
          //     ),
          //         label: 'Home'),
          //     BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined,
          //         color: Colors.white
          //     ),
          //         label: 'Add post'),
          //     BottomNavigationBarItem(icon: Icon(Icons.wechat,
          //       color: Colors.white,
          //     ),
          //         label: 'Chat'),
          //     BottomNavigationBarItem(icon: Icon(Icons.person,
          //       color: Colors.white,
          //     ),
          //         label: 'Profile'),
          //
          //   ]) ,

    );
  }
}


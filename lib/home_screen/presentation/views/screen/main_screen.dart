import 'package:flutter/material.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/home_screen/presentation/views/screen/profile_screen.dart';
import '../../../../card_for_find_and_search_person/screens/card_for_find_and_search_person.dart';
import 'home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Index of the selected tab

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: ScreensColors.orangeColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          mini: true,
            backgroundColor: ScreensColors.orangeColor,
          shape: StadiumBorder(
            // side: BorderSide(
            //   color:  Color.fromRGBO(24, 13, 31, 1.0),  // Set your desired color
            //   width: 1.0,
            //
            // ),
          ),
          focusColor: Color(30),
          child: Icon(Icons.add,
          size: 30.0,
            color:  Color.fromRGBO(24, 13, 31, 1.0),  // Set your desired color
          ),
            onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CardCustom()),);
            }),
        body:tabs[_currentIndex],
        bottomNavigationBar: BottomAppBar(

          color:  Color.fromRGBO(24, 13, 31, 1.0),  // Set your desired color
          shape: CircularNotchedRectangle(),
          notchMargin: 2.0,
          child: BottomNavigationBar(

            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Colors.transparent,
            // backgroundColor: Color.fromRGBO(24, 13, 31, 1.0), // Set the background color here
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
                icon: Icon(Icons.person_rounded),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
  List <Widget> tabs = [HomeScreen(), profileScreen()];
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/core/utilis/colors.dart';
import 'package:mafqood/home_screen/presentation/views/screen/profile_screen.dart';
import '../../../../card_for_find_and_search_person/screens/card_for_find_and_search_person.dart';
import '../../../../persons_bloc/persons_bloc.dart';
import '../../../../profile_bloc/profile_bloc.dart';
import '../../../../profile_screen/presentation/views/screens/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Index of the selected tab
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var personsBloc = BlocProvider.of<PersonsBloc>(context);
    personsBloc.add(GetFoundedOrMissingPersonsEvent());
    var profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(GetProfileDataEvent());
  }

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
            side: BorderSide(
              color:  Color.fromRGBO(24, 13, 31, 1.0),  // Set your desired color
              width: 1.0,

            ),
          ),
          focusColor: Color(30),
          child: Icon(Icons.add,
          size: 30.0,
            color:  ScreensColors.primaryColor,
          ),
            onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CardCustom()),);
            }),
        body:tabs[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          color:  ScreensColors.primaryColor,  // Set your desired color
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
            selectedItemColor: ScreensColors.orangeColor,
            unselectedItemColor: ScreensColors.greyColor,
            type: BottomNavigationBarType.fixed,
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
  List <Widget> tabs = [HomeScreen(), ProfileScreen1()];
 }
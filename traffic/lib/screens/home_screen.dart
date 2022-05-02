//import 'dart:ffi';
//import 'dart:html';



import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:traffic/screens/cam_screen.dart';
import 'package:traffic/screens/home.dart';

import 'package:traffic/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late List<Widget> _pages;
  late Widget _homeScreen;
  late Widget _camScreen;
  late Widget _settingsScreen;
  late int currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _homeScreen = const Home();
    _camScreen = const CamScreen();
    _settingsScreen = SettingsScreen(changePage: _changeTab);
    _pages = [ _camScreen,_homeScreen, _settingsScreen];
   currentIndex=1;
    _currentPage = _homeScreen;
  }

  void _changeTab(int index) {
    setState(() {
      currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: _currentPage,
      bottomNavigationBar: ConvexAppBar(
        elevation: 10,
          //activeColor: Colors.purple,
          color: Colors.white,
          backgroundColor: Color(0xA34450F1),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [

              Color(0xF64450F1),
              Color(0xF4CC02D8),
            ]

          ),
          initialActiveIndex: 1,
          onTap: (index) {
            _changeTab(index);
          },

          items: [
            TabItem(icon: Icons.camera_alt, title: 'camera',),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ]),
      drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              _navigationItemListTitle( 0),
              _navigationItemListTitle( 1),
              _navigationItemListTitle( 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigationItemListTitle( int index) {
    return ListTile(

      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }


}





/*I*/

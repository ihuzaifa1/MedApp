import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare_dart/MainPage.dart';

class navbar extends StatefulWidget {
  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedscreen = 0;
  final _screens = [
    MainPage(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedscreen],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedscreen,
          onTap: (index) {
            setState(() {
              _selectedscreen = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text),
              label: "ChatBot",
            ),
          ],
        ),
      ),
    );
  }
}

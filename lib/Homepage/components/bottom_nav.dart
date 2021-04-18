import 'package:flutter/material.dart';
import 'package:fourgreen/Fitur/NewsUpdate/newsupdate.dart';
import 'package:fourgreen/Homepage/components/communityscreen.dart';
import 'package:fourgreen/Homepage/components/homescreen.dart';
import 'package:fourgreen/Homepage/components/notificationscreen.dart';
import 'package:fourgreen/Homepage/components/profilescreen.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    CommunityScreen(),
    NewsUpdate(),
    NotificationScreen(),
    ProfileScreen(),
  ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
       currentIndex: _currentIndex,
       selectedItemColor: Colors.red,
       unselectedItemColor: Colors.grey,
       unselectedFontSize: 10,
       selectedFontSize: 10,
       iconSize: 20,
       showUnselectedLabels: true,
       type: BottomNavigationBarType.fixed,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home_outlined),
           label: 'HOME',
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.group_outlined),
           label: 'COMUNNITY',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.now_widgets_outlined),
           label: 'NEWSUPDATE',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.mail_outline),
           label: 'NOTIFIKASI',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person_outline),
           label: 'PROFILE',
         )
       ],
     ),
   );
 }
 void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

}


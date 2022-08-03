import 'package:flutter/material.dart';
import 'package:trips_project/constants/constants.dart';
import '../../../classes/CustomAnimatedBottomBar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}
final _inactiveColor = Colors.grey;
final _ActiveColor = AppButtons;
class _BottomBarState extends State<BottomBar> {
  Widget build(BuildContext context) {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: _ActiveColor ,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.remove_red_eye),
          title: Text('Watch list'),
          activeColor: _ActiveColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),

        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Inbox ',
          ),
          activeColor: _ActiveColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: _ActiveColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  int _currentIndex = 0;
}

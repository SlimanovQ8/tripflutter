import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:trips_project/constants/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric( horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[




            ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 40),
                    primary: AppButtons
                  ),
                  child: Text("Book"),
                  onPressed: () {},
                )


          ],
        ),
      ),
    );
  }
}

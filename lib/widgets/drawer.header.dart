import 'package:flutter/material.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration : BoxDecoration(
          gradient : LinearGradient(
              colors: [
                Colors.pinkAccent,
                Colors.white
              ]
          )
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/logo.png"),
              radius : 60,
            )
          ]
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration : BoxDecoration(
          gradient : LinearGradient(
              colors: [
                Colors.orange,
                Colors.deepOrangeAccent,
                Colors.red,
                Colors.redAccent
              ]
          )
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
              radius : 70,
            )
          ]
      ),
    );
  }
}

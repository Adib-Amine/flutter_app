import 'package:flutter/material.dart';
import 'package:git_app/pages/home.page.dart';
import 'package:git_app/pages/counter.page.dart';

import 'drawer.header.dart';

class MyDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children : [
              MyDrawerHeaderWidget(),
              ListTile(
                //l'icone du home à gauche
                leading: Icon(Icons.home,color: Colors.lightBlueAccent),
                //la petite fléche à droite
                trailing: Icon(Icons.arrow_right,color:Colors.lightBlueAccent),
                title: Text("Home",style:TextStyle(fontSize: 18,color: Colors.lightBlueAccent)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  HomePage()));
                },
              ),
              Divider(
                  color : Colors.blueAccent
              ),
              ListTile(
                //l'icone du home à gauche
                leading: Icon(Icons.confirmation_number,color: Colors.lightBlueAccent),
                //la petite fléche à droite
                trailing: Icon(Icons.arrow_right,color:Colors.lightBlueAccent),
                title: Text("Counter",style:TextStyle(fontSize: 18,color: Colors.lightBlueAccent)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  CounterPage()));
                },
              ),
              Divider(
                  color : Colors.blueAccent
              ),
              ListTile(
                //l'icone du home à gauche
                leading: Icon(Icons.supervised_user_circle,color: Colors.lightBlueAccent),
                //la petite fléche à droite
                trailing: Icon(Icons.arrow_right,color:Colors.lightBlueAccent),
                title: Text("Users",style:TextStyle(fontSize: 18,color: Colors.lightBlueAccent)),
              )
            ]
        )
    );
  }
}
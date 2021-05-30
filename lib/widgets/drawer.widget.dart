import 'package:flutter/material.dart';
import 'package:git_app/pages/home.page.dart';
import 'package:git_app/pages/counter.page.dart';
import 'package:git_app/pages/pixabay.page.dart';
import 'package:git_app/pages/ocr.page.dart';
import 'package:git_app/pages/qrcode.page.dart';
import 'package:git_app/pages/users.page.dart';
import 'package:git_app/pages/weather.form.dart';
import 'drawer.header.dart';

class MyDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children : [
              MyDrawerHeaderWidget(),
              ListTile(
                leading: Icon(Icons.home,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("Home",style:TextStyle(fontSize: 18,color: Colors.red)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  HomePage()));
                },
              ),
              Divider(
                  color : Colors.redAccent
              ),
              ListTile(
                leading: Icon(Icons.confirmation_number,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("Counter",style:TextStyle(fontSize: 18,color: Colors.red)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  CounterState()));
                },
              ),
              Divider(
                  color : Colors.redAccent
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("GitHub",style:TextStyle(fontSize: 18,color: Colors.red)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  UsersPage()));
                },
              ),
              Divider(
                  color : Colors.redAccent
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("Pixabay",style:TextStyle(fontSize: 18,color: Colors.red)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Gallery()));
                },
              ),
              Divider(
                  color : Colors.redAccent
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("Metoe",style:TextStyle(fontSize: 18,color: Colors.red)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  WeatherForm()));
                },
              ),
              Divider(
                  color : Colors.redAccent
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("QR CODE",style:TextStyle(fontSize: 18,color: Colors.red)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  QRPage()));
                },
              ),
              Divider(
                  color : Colors.redAccent
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("OCR",style:TextStyle(fontSize: 18,color: Colors.red)),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  OCRPage()));
                },
              ),
              Divider(
                  color : Colors.redAccent
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle,color: Colors.red),
                trailing: Icon(Icons.arrow_right,color:Colors.red),
                title: Text("Autres fonctionnalites",style:TextStyle(fontSize: 18,color: Colors.red)),
              ),
              Divider(
                  color : Colors.redAccent
              ),
            ]
        )
    );
  }
}
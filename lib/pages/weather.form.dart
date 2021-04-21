import 'package:flutter/material.dart';
import 'package:git_app/widgets/drawer.widget.dart';
import './weather.page.dart';
import 'package:flutter/cupertino.dart';

class WeatherForm extends StatefulWidget {
  @override
  _WeatherFormState createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  String city = "Meteo";
  TextEditingController cityEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(
        title: Text('${city}'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:10,top:10,right:10,bottom:0),
            child: TextField(
              // decoration: InputDecoration(hintText: 'Ville'),
              decoration: InputDecoration(
                hintText: 'Ville',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 1,color: Colors.red
                      )
                  )
              ),
              controller: cityEditingController,
              onChanged: (String str) {
                setState(() {
                  city = str;
                });
              },
              onSubmitted: (String str) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Weather(city)));
                cityEditingController.text = "";
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left:20,top:0,right:20,bottom:0),
            child: RaisedButton(
              child: Text('Voir la météo'),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Weather(city)));
                cityEditingController.text = "";
              },
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

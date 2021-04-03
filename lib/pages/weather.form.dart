import 'package:flutter/material.dart';
import './weather.page.dart';
import 'package:flutter/cupertino.dart';

class WeatherForm extends StatefulWidget {
  @override
  _WeatherFormState createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  String city = "";
  TextEditingController cityEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${city}'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              decoration: InputDecoration(hintText: 'Entrez une ville...'),
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
            padding: EdgeInsets.all(10),
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

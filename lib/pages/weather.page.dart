import 'package:flutter/material.dart';
import 'package:git_app/widgets/drawer.widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class Weather extends StatefulWidget {
  String city = "";
  Weather(this.city);
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<dynamic> weatherData;
  getData(url) {
    http.get(Uri.parse(url), headers: {'accept': 'application/json'}).then(
        (resp) {
      setState(() {
        weatherData = json.decode(resp.body)['list'];
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String url = 'https://samples.openweathermap.org/data/2.5/forecast?q=${this.widget.city}&appid=32fad651d7d87f383441524acd479b41';
    print(url);
    this.getData(url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: MyDrawerWidget(),
        appBar: AppBar(
          title: Text('${widget.city}'),
          backgroundColor: Colors.red,
        ),
        body: (weatherData == null)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: weatherData == null ? 0 : weatherData.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'images/${weatherData[index]['weather'][0]['main'].toLowerCase()}.png'),
                                    radius: 20,
                                backgroundColor: Colors.transparent,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${new DateFormat('Edd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))}|"
                                      "${weatherData[index]['weather'][0]['main']}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${weatherData[index]['main']['temp'].round()} ??C",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}

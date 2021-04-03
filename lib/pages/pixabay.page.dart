import 'package:flutter/material.dart';
import './pixabay.data.dart';
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}
class _GalleryState extends State<Gallery> {
  String keyword = "";
  TextEditingController editingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('${keyword}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'KeyWord'),
                onChanged: (value) {
                  setState(() {
                    this.keyword = value;
                  });
                },
                onSubmitted: (value) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GalleryDataPage(value)));
                },
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GalleryDataPage(keyword)));
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Get Data'),
                ),
              )
            ],
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GitPage extends StatefulWidget {
  String login;
  String avatar;
  GitPage({this.login});

  @override
  _GitPageState createState() => _GitPageState();
}

class _GitPageState extends State<GitPage> {
  dynamic dataRepositories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepositories();
  }

  void loadRepositories() async {
    String url = "https://api.github.com/users/${widget.login}/repos";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        dataRepositories = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositories ${widget.login}"),
      ),
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text("${dataRepositories[index]['name']}"),
                  ),
              separatorBuilder: (context, index) =>
                  Divider(height: 2, color: Colors.red),
              itemCount:
                  dataRepositories == null ? 0 : dataRepositories.length)),
    );
  }
}

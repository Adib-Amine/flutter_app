import 'package:flutter/material.dart';
import 'package:git_app/widgets/drawer.widget.dart';


class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(title:Text("Counter"),),
      body: Center(
          child: Text("I'm in Counter")),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: (){

            },
          ),
          SizedBox(width: 6,),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){

            },
          ),
        ],
      ),

    );
  }
}
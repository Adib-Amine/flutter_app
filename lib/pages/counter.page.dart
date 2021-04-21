import 'package:flutter/material.dart';
import 'package:git_app/widgets/drawer.widget.dart';

// class CounterPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home: CounterState(),
//     );
//   }
// }

class CounterState extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<CounterState>{
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: MyDrawerWidget(),
      appBar: AppBar(
        title:Text("Counter"),
        // backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }

}
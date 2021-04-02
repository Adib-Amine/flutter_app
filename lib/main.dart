import 'package:flutter/material.dart';
import 'package:git_app/widgets/drawer.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'my first app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              bodyText2: TextStyle(
                  fontSize: 18,
                  color: Colors.blueAccent
              )
          )
      ),
      home:Scaffold(
        drawer: MyDrawerWidget(),
        appBar: AppBar(title: Text("Home Page"),),
        body: Center(
          child: Text("Yeah im working !"),
        ),

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title:"Git App",
//       theme: ThemeData(
//         primaryColor: Colors.deepOrange,
//         textTheme: TextTheme(
//           bodyText2: TextStyle(
//             fontSize: 16,
//             color: Colors.deepOrange
//           )
//         )
//       ),
//       home:Scaffold(
//         appBar: AppBar(title: Text("Hello Page")),
//         body: Center(
//           child: Text("Hello Amine",style: TextStyle(
//             fontSize: 22,color: Colors.deepOrange
//           ),),
//         ),
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             FloatingActionButton(
//                 child: Icon(Icons.remove),
//                 onPressed: (){
//
//             }),
//             SizedBox(width: 6,),
//             FloatingActionButton(
//                 child: Icon(Icons.add),
//                 onPressed: (){
//
//                 })
//           ],
//         )
//       )
//     );
//   }
//
// }
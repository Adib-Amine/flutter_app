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
      title: 'flutter App',
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
              bodyText2: TextStyle(
                  fontSize: 18,
                  color: Colors.redAccent
              )
          )
      ),
      home:Scaffold(
        drawer: MyDrawerWidget(),
        appBar: AppBar(title: Text("Home Page"),),
        body: Center(
          child: Text("Flutter App"),
        ),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
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
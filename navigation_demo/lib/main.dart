import 'package:flutter/material.dart';
import 'package:navigation_demo/screen0.dart';
import 'package:navigation_demo/screen1.dart';
import 'package:navigation_demo/screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //can't have this and home: some Screen simultaneously
      routes: {
        //this is basically a map, with string,function pair
        '/': (context) => Screen0(),
        '/first': (context) => Screen1(),
        '/second': (context) => Screen2(),
      },
    );
  }
}

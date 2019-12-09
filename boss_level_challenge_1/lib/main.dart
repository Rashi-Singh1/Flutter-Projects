import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue.shade800,
        ),
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Ball(),
        ),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNo = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () {
              print('I was pressed');
              setState(() {
                ballNo = Random().nextInt(5) + 1;
                print('ballNo is $ballNo');
              });
            },
            child: Image.asset('images/ball$ballNo.png'),
          ),
        )
      ],
    );
  }
}

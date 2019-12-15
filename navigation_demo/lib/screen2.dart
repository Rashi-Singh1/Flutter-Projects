import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Screen 2'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          child: Text('Go Back To Screen 1'),
          onPressed: () {
            Navigator.pop(context);
            //to remove second screen, ow could cause stack overflow

            Navigator.pushNamed(context, '/first');
            //if simply pop might be possible that got to screen2 from screen0, therefore won't return to screen1
          },
        ),
      ),
    );
  }
}

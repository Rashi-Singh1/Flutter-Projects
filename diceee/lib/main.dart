import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Dicepage(),
      ),
    ),
  );
}

class Dicepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment
          .stretch, //rather than this, can wrap with a center widget
      children: <Widget>[
        Expanded(
          //to utilize the space by filling jitna possible hai
//            flex: 2,    //to specify ratio when multiple expanded in a row
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('images/dice1.png'),
          ),
        ),
        Expanded(
//            flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('images/dice6.png'),
          ),
//            child: Image(
//              image: AssetImage('images/dice2.png'),
//            ), //another way to add image
        ),
      ],
    );
  }
}

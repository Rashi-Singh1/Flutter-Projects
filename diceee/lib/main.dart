import 'dart:math';

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
        body: Dice(),
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
          child: FlatButton(
            onPressed: () {
              //this is a void anonymous function which does not accept parameters
              print('Left Button was pressed');
            },
            child: Image.asset('images/dice1.png'),
          ),
        ),
        Expanded(
//            flex: 1,
          child: FlatButton(
            onPressed: () {
              print('Right Button was pressed');
            },
            child: Image.asset('images/dice6.png'),
          ),
        ),
      ],
    );
  }
}

//Stateless Widget is used if the stuff on screen won't change on user interaction
// therefore is app ke liye stateful widget would be better, since tap pe image would change
class Dice extends StatefulWidget {
  @override
  _DiceState createState() =>
      _DiceState(); //constructor for the class _DiceState
  //rather than build called here, it returns the State after creating one
}

class _DiceState extends State<Dice> {
  int leftdice = 1, rightdice = 1;

  void setNumber() {
    setState(() {
      leftdice = new Random().nextInt(6) + 1;
      print('leftdice no. is $leftdice');
      rightdice = new Random().nextInt(6) + 1;
      print('rightdice no. is $rightdice');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment
          .stretch, //rather than this, can wrap with a center widget
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () {
              //this is a void anonymous function which does not accept parameters
              print('Left Button was pressed');
              setNumber();
            },
            child: Image.asset('images/dice$leftdice.png'),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {
              print('Right Button was pressed');
              setNumber();
            },
            child: Image.asset('images/dice$rightdice.png'),
          ),
        ),
      ],
    );
  }
}

import 'package:english_words/english_words.dart'; //to add new package, add dependency, run get package and then add import command
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(nouns.last), //can check this from external libraries
          ),
        ),
      ),
    );
  }
}

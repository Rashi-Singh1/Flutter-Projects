import 'package:audioplayers/audio_cache.dart';
import 'package:english_words/english_words.dart'; //to add new package, add dependency, run get package and then add import command
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class PackageEx extends StatelessWidget {
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

class XylophoneApp extends StatelessWidget {
  void play(int i) {
    final AudioCache player = AudioCache();
    player.play('note$i.wav');
  }

  Expanded buildKey(int num, Color color) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
        onPressed: () {
          play(num);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        body: Column(
          children: <Widget>[
            buildKey(1, Colors.red),
            buildKey(2, Colors.orange),
            buildKey(3, Colors.yellow),
            buildKey(4, Colors.green),
            buildKey(5, Colors.teal),
            buildKey(6, Colors.blue),
            buildKey(7, Colors.deepPurpleAccent),
          ],
        ),
      ),
    );
  }
}

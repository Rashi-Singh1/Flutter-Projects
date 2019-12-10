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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('note1.wav');
                },
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('note2.wav');
                },
                child: Container(
                  color: Colors.orange,
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('note3.wav');
                },
                child: Container(
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('note4.wav');
                },
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('note5.wav');
                },
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('note6.wav');
                },
                child: Container(
                  color: Colors.indigo,
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('note7.wav');
                },
                child: Container(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

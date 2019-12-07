import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text("This is the AppBar title"),
      backgroundColor: Colors.blueGrey[900],
    ),
    body: Center(
      child: Image(
        image: NetworkImage(
            'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
      ),
    ),
    backgroundColor: Colors.blueGrey[10],
  )));
}

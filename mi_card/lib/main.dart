import 'package:flutter/material.dart';

void main() {
  runApp(LayoutChallenge());
}

//stateless widget that has the build function for hot reload to run
//stateless because on hot reload, the data inputted won't change, for example counter value will be same, color would change
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
            //keeps content in safe area (without bessels n stuff)
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize
                  .max, //can keep this min, if want the column to end at the edge of the last element
              verticalDirection: VerticalDirection
                  .down, //elements ka order same, but positioning neeche (if alignment not specified)
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, //can see various other options here
              crossAxisAlignment: CrossAxisAlignment
                  .start, //can make this stretch to prevent adding width for all children (to take the entire screen)
              children: <Widget>[
                Container(
                  //made this extra container to find out if wrap content happens for child, by using max possible width for child
                  padding: EdgeInsets.all(30.0),
                  color: Colors.red,
                  //width: 380.0,
                  child: Container(
                    //this is like a div (in web-dev)
                    //by default width and height acc to the child
                    //if no child then takes max space possible
                    //width: double.maxFinite,
                    child: Text("Zenitsu in container 2"),
                    margin: EdgeInsets.all(20.0), //value in pixels
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                    color: Colors.white,
                  ),
                ),
                Container(
                  //made this extra container to find out if wrap content happens for child, by using max possible width for child
                  padding: EdgeInsets.all(30.0),
                  color: Colors.lightGreen,
                  //width: 380.0,
                  child: Container(
                    child: Text("Inosuke in container 2"),
                    margin: EdgeInsets.all(20.0), //value in pixels
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                    color: Colors.white,
                  ),
                ),
                Container(
                  //made this extra container to find out if wrap content happens for child, by using max possible width for child
                  padding: EdgeInsets.all(30.0),
                  color: Colors.blueGrey,
                  //width: 380.0,
                  child: Container(
                    child: Text("Tomioka San in container 1"),
                    margin: EdgeInsets.all(20.0), //value in pixels
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
//              width: double.maxFinite,
              child: Column(
                children: <Widget>[
                  Flexible(
                      child: Text(
                    "Hi",
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.redAccent),
                  )),
                  SizedBox(height: 5.0),
                  Container(
                      color: Colors.black,
                      child: Text('Bye',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 40)))
                ], //supposedly this makes text wrap the content
              ),
            )
          ],
        )),
      ),
    );
  }
}

class LayoutChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 100.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                  )
                ],
              ),
              Container(
                color: Colors.blue,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

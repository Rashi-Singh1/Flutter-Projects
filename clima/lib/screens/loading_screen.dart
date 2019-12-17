import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    //added async so that this time consuming n unpredictable time function can happen in the background

    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low); //sufficient to get weather
      print(
          position); //due to await, position is printed after it is populated with the right value
    } catch (e) {
      print(e);
    }
  }

  //example to show what causes exceptions
  void somethingThatExpectsLessThan10(int num) {
    if (num >= 10) throw 'num should always be less than 10';
  }

  @override
  void initState() {
    //only called once when the stful widget is added to the tree, for stless, sirf build hai, no init
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    //called everytime a change is made or widget is destroyed (stless)
    //therefore don't wanna put expensive code here
    return Scaffold();
  }

  @override
  void deactivate() {
    //this gets called when widget is going to be destroyed
    // TODO: implement deactivate
    super.deactivate();
  }
}

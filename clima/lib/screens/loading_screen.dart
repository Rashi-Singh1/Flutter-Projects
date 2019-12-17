import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //example to show what causes exceptions
  void somethingThatExpectsLessThan10(int num) {
    if (num >= 10) throw 'num should always be less than 10';
  }

  Location location = new Location();

  @override
  void initState() {
    //only called once when the stful widget is added to the tree, for stless, sirf build hai, no init
    super.initState();
    getLocation();
    getData();
  }

  Future getLocation() async {
    await location.getCurrentLocation();
    print('latitude : ${location.latitude}');
    print('longitude : ${location.longitude}');
  }

  void getData() async {
    Response response = await get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=b6907d289e10d714a6e88b30761fae22');
    print(response);
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

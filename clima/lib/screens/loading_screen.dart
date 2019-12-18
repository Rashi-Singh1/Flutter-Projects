import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '0643e08a3ebc462dc41d21e6f8a64894';

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
    getLocationData();
  }

  Future getLocationData() async {
    await location.getCurrentLocation();
    print('latitude : ${location.latitude}');
    print('longitude : ${location.longitude}');
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var decodedData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(decodedData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    //called everytime a change is made or widget is destroyed (stless)
    //therefore don't wanna put expensive code here

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }

  @override
  void deactivate() {
    //this gets called when widget is going to be destroyed
    // TODO: implement deactivate
    super.deactivate();
  }
}

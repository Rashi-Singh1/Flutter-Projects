import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    getLocation();
  }

  Future getLocation() async {
    await location.getCurrentLocation();
    print('latitude : ${location.latitude}');
    print('longitude : ${location.longitude}');
    getData(); //adding here so that we have sahi data
  }

  void getData() async {
    //added 'as' in import to make this easier to read (that this uses http package)
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    //Response class is used when the entire response body is known at once

    print('Called get on the following : ');
    print(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    if (response.statusCode == 200) {
      String responseData = response.body;
      print(responseData);

      /*
      var longitude = jsonDecode(responseData)['coord']['lon']; //this method is used to parse JSON object
      print(longitude);

      var weatherDescription =
          jsonDecode(responseData)['weather'][0]['description'];

      //note there is a zero bcs weather ke andar is a list having only one item and each list_item further has 4 sub_items
      //can copy path to reach an entry like this from JSON Viewer Awesome

      print(weatherDescription);
      */

      var decodedData = jsonDecode(responseData);
      var cityName = decodedData['name'];
      var weatherId = decodedData['weather'][0]['id'];
      var temp = decodedData['main']['temp'];
    } else
      print('error code: ${response.statusCode}');

    //Status Codes in short
    //1**  Hold on (wait)
    //2**  Here you go (success)
    //3**  Go away (unauthorized to access)
    //4**  You fucked up
    //5**  I(server) fucked up
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

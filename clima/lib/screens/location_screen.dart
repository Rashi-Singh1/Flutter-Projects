import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String cityName;
  int weatherId;
  String temp;
  String weatherIcon;
  String message;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
    //Since state and the parent widget are diff classes, we can not directly use locationWeather
    //However, the State widget has a 'widget' property that can be used to access its parent
    //using this parent, can access the attributes of the parent
  }

  void updateUI(var locationWeather) {
    WeatherModel weatherModel = new WeatherModel();

    setState(() {
      var weatherId = locationWeather['weather'][0]['id'];
      this.cityName = locationWeather['name'];
      this.temp = locationWeather['main']['temp'].toStringAsFixed(2);
      int temperature = locationWeather['main']['temp'].toInt();
      this.weatherIcon = weatherModel.getWeatherIcon(weatherId);
      this.message = weatherModel.getMessage(temperature);
    });

    print(temp);
    print(cityName);
    print(weatherId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      this.weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${this.message} in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

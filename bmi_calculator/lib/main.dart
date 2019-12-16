import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbColor: kBottomContainerColor,
          inactiveTrackColor: kCardTextColor,
          overlayColor: Color(0x29EB1555),
          activeTrackColor: Colors.white,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
        ),
        //this is app wide theme
        //to use baaki sab from dark theme and only changing some stuff
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}

import 'package:bmi_calculator/components/incrementor_card.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/reusable_gesture_detector.dart';
import 'package:bmi_calculator/components/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'results_page.dart';

enum GenderType { male, female } //must be outside any class
//none can be added so that selected item can be deselected without having to select gender

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender;
  double fSliderHeight = 180.0;
  int iSliderHeight = 180;
  int weight = 60;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //top row
            Flexible(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: ReusableCard(
                        colour: gender == GenderType.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent(
                          childText: 'MALE',
                          iconData: FontAwesomeIcons.mars,
                        ),
                        tapFunction: () {
                          print('Male card was pressed');
                          setState(() {
                            gender = GenderType.male;
                          });
                        }),
                  ),
                  Flexible(
                    child: ReusableCard(
                      colour: gender == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        childText: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      ),
                      tapFunction: () {
                        print('Female card was pressed');
                        setState(() {
                          gender = GenderType.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            //slider
            Flexible(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    ReusableRow(
                      mainThing: iSliderHeight,
                      unit: 'cm',
                    ),
                    Slider(
                      //added its theme in main.dart to make it common for all sliders
                      value: iSliderHeight.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newValue) {
                        print(newValue);
                        setState(() {
                          iSliderHeight = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),

            //bottom row
            Flexible(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: IncrementorCard(
                      titleText: 'WEIGHT',
                      unit: 'kg',
                      mainThing: weight,
                      lessFunction: () {
                        setState(() {
                          weight--;
                        });
                      },
                      moreFunction: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: IncrementorCard(
                      titleText: 'AGE',
                      unit: 'yrs',
                      mainThing: age,
                      lessFunction: () {
                        setState(() {
                          age--;
                        });
                      },
                      moreFunction: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            //result button
            new ReusableGestureDetector(
              text: 'CALCULATE',
              onTap: () {
                CalculatorBrain brain =
                    CalculatorBrain(height: iSliderHeight, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: brain.calculateBMI(),
                              resultText: brain.getResult(),
                              interpretation: brain.getInterpretation(),
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}

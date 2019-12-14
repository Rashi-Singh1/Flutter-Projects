import 'package:bmi_calculator/incrementor_card.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //top row
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
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
//                        toggleCardColor(GenderType.male);
                          gender = GenderType.male;
                        });
                      }),
                ),
                Expanded(
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
//                        toggleCardColor(GenderType.female);
                        gender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          //slider
          Expanded(
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
//                        sliderheight = newValue.toStringAsFixed(2); //to truncate but gives string
//                        sliderheight = (newValue * 100).round() / 100;  //to get upto 2 decimal precision height
                        iSliderHeight = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),

          //bottom row
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
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
                Expanded(
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
          Container(
            height: Height * 0.08,
            color: kBottomContainerColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20.0),
          )
        ],
      ),
    );
  }
}

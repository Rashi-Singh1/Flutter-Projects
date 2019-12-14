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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        iSliderHeight.toString(),
                        style: kHeavyTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: kBottomContainerColor,
                        inactiveTrackColor: kCardTextColor,
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0)),
                    child: Slider(
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
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor),
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

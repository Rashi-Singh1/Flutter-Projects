import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const double bottomContainerHeight = 40.0;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const Color bottomContainerColor = Color(0xFFEB1555);
const Color innerContainerTextColor = Color(0xFF8D8E98);

enum GenderType { male, female, none } //must be outside any class
//none is added so that selected item can be deselected without having to select gender

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender;

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    //this does not impose any styling like flatbutton and this has diff types of gesture detection
                    onTap: () {
                      print('Male card was pressed');
                      setState(() {
//                        toggleCardColor(GenderType.male);
                        gender = gender == GenderType.male
                            ? GenderType.none
                            : GenderType.male;
                      });
                    },
                    child: ReusableCard(
                      colour: gender == GenderType.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        childText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Female card was pressed');
                      setState(() {
//                        toggleCardColor(GenderType.female);
                        gender = gender == GenderType.female
                            ? GenderType.none
                            : GenderType.female;
                      });
                    },
                    child: ReusableCard(
                      colour: gender == GenderType.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        childText: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: activeCardColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activeCardColor),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColor),
                ),
              ],
            ),
          ),
          Container(
            height: Height * 0.08,
            color: bottomContainerColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20.0),
          )
        ],
      ),
    );
  }
}

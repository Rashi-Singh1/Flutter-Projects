import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const double bottomContainerHeight = 40.0;
const Color innerContainerColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);
const Color innerContainerTextColor = Color(0xFF8D8E98);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReusableCard(
                    colour: innerContainerColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      childText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: innerContainerColor,
                    cardChild: IconContent(
                      childText: 'FEMALE',
                      iconData: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: innerContainerColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: innerContainerColor),
                ),
                Expanded(
                  child: ReusableCard(colour: innerContainerColor),
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

import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class IncrementorCard extends StatelessWidget {
  final String titleText;
  final String unit;
  final int mainThing;
  final Function lessFunction;
  final Function moreFunction;

  IncrementorCard(
      {this.titleText,
      this.unit,
      this.mainThing,
      this.lessFunction,
      this.moreFunction});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            titleText,
            style: kLabelTextStyle,
          ),
          ReusableRow(mainThing: mainThing, unit: unit),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                childIcon: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                function: lessFunction,
              ),
              RoundIconButton(
                childIcon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                function: moreFunction,
              )
            ],
          )
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final int mainThing;
  final String unit;
  ReusableRow({this.mainThing, this.unit});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          mainThing.toString(),
          style: kHeavyTextStyle,
        ),
        Text(
          unit,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

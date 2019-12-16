import 'package:flutter/material.dart';

import '../constants.dart';

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

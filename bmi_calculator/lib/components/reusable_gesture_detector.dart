import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableGestureDetector extends StatelessWidget {
  final String text;
  final Function onTap;

  ReusableGestureDetector({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(
          child: Text(
            this.text,
            style: kLargeButtonTextStyle,
          ),
        ),
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.0),
      ),
    );
  }
}

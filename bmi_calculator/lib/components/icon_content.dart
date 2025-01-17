import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  final String childText;
  final IconData iconData;

  IconContent({this.childText, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Icon(
          this.iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: Text(
            childText,
            style: kLabelTextStyle,
          ),
        )
      ],
    );
  }
}

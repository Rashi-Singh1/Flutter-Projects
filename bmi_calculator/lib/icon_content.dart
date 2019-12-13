import 'package:flutter/material.dart';

const double bottomContainerHeight = 40.0;
const Color innerContainerColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);
const Color innerContainerTextColor = Color(0xFF8D8E98);
const TextStyle labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: innerContainerTextColor,
);

class IconContent extends StatelessWidget {
  final String childText;
  final IconData iconData;

  IconContent({this.childText, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          childText,
          style: labelTextStyle,
        )
      ],
    );
  }
}

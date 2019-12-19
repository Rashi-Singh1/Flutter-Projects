import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 70.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

class DecoratedTextField extends StatelessWidget {
  final String hintText;
  final IconData sideIcon;
  final Function onChanged;

  DecoratedTextField({this.hintText, this.sideIcon, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white60,
          hintText: this.hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade700,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          icon: Icon(
            this.sideIcon,
            color: Colors.white60,
            size: 38.0,
          ),
        ),
        onChanged: this.onChanged);
  }
}

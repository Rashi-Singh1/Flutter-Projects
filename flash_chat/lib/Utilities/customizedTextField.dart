import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  final String hintText;
  final Color colour;
  final Function onChanged;
  final bool obscured;
  final TextInputType keyboardType;

  CustomizedTextField(
      {@required this.colour,
      @required this.hintText,
      @required this.onChanged,
      this.obscured,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: this.keyboardType,
      onChanged: this.onChanged,
      obscureText: this.obscured != null ? obscured : false,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: this.hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: this.colour, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: this.colour, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}

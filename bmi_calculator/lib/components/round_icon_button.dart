import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Widget childIcon;
  final Function function;
  RoundIconButton({this.childIcon, this.function});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
      fillColor: Color(0xFF4C4F5E),
      child: childIcon,
      onPressed: function,
    );
  }
}

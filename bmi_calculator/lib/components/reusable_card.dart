import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
//  const ReusableContainer({
//    Key key,
//  }) : super(key: key);
//  since this is a stateless widget, we don't really need key, bcs this widget won't change

  final Color colour;
  final Widget cardChild;
  final Function tapFunction;
  //this needs to be final, bcs we are using stateless widget which is immutable, i.e. once made, it can't change the value
  //also we can not use const instead of final here, even tho both used for immutable values, bcs const needs to be set at runtime, whereas final can be set later on (once) and our reusable container may be made after compilation

  ReusableCard({@required this.colour, this.cardChild, this.tapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        child: cardChild,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: this.colour,
        ),
        margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
//                  height: 200.0,
      ),
    );
  }
}

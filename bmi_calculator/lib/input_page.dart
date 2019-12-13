import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ReusableRow(),
          ),
          Expanded(
            child: ReusableContainer(colour: Color(0xFF1D1E33)),
          ),
          Expanded(
            child: ReusableRow(),
          ),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
//  const ReusableRow({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ReusableContainer(colour: Color(0xFF1D1E33)),
        ),
        Expanded(
          child: ReusableContainer(colour: Color(0xFF1D1E33)),
        ),
      ],
    );
  }
}

class ReusableContainer extends StatelessWidget {
//  const ReusableContainer({
//    Key key,
//  }) : super(key: key);
//  since this is a stateless widget, we don't really need key, bcs this widget won't change

  final Color colour;
  //this needs to be final, bcs we are using stateless widget which is immutable, i.e. once made, it can't change the value
  //also we can not use const instead of final here, even tho both used for immutable values, bcs const needs to be set at runtime, whereas final can be set later on (once) and our reusable container may be made after compilation

  ReusableContainer({@required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: this.colour,
      ),
      margin: EdgeInsets.all(15.0),
//                  height: 200.0,
    );
  }
}

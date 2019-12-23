import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  final Widget child;
  CurvedContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.0), topRight: Radius.circular(28.0)),
        color: Colors.white,
      ),
      child: this.child,
    );
  }
}

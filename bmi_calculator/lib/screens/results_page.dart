import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/reusable_gesture_detector.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text('BMI-CALCULATOR'),
//        ),
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              '   YOUR RESULT',
              style: kHeavyTextStyle.copyWith(fontSize: 30.0),
              textAlign: TextAlign.left,
            ),
            ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  new FormattedText(
                    text: resultText.toUpperCase(),
                    textStyle: TextStyle(color: Colors.green, fontSize: 22.0),
                    padding: 0.0,
                  ),
                  new FormattedText(
                    text: bmiResult,
                    textStyle: kHeavyTextStyle.copyWith(fontSize: 58.0),
                    padding: 55.0,
                  ),
                  new FormattedText(
                    text: 'NORMAL BMI RANGE:',
                    textStyle: kLabelTextStyle,
                    padding: 5.0,
                  ),
                  new FormattedText(
                    text: '18.5 - 25 kg/m2',
                    textStyle: kLabelTextStyle.copyWith(color: Colors.white),
                    padding: 0.0,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  new FormattedText(
                    text: interpretation,
                    textStyle: kLabelTextStyle.copyWith(color: Colors.white),
                    padding: 20.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              ),
            ),
            new ReusableGestureDetector(
                text: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    ));
  }
}

class FormattedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double padding;

  FormattedText({this.text, this.textStyle, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

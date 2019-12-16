import 'dart:math';

class CalculatorBrain {
  int height = 0;
  int weight = 0;
  double _bmi = 0.0;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    this._bmi = bmi;
    print(this._bmi);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (this._bmi >= 25)
      return 'Overweight';
    else if (this._bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (this._bmi >= 25)
      return 'You have a higher than normal body weight. Try to exercise more';
    else if (this._bmi > 18.5)
      return 'you have a normal body weight. Good job';
    else
      return 'You have a lower than normal body weight. You can eat a bit more';
  }
}

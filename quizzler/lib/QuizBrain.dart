import 'package:quizzler/question.dart';

//this class shows the use of abstraction in OOP, as now a large codebase is divided into separate chunks, making it more modular
//this also allows to use diff quesBanks, by making multiple quizBrains like sportsQuizBrain and then changing the start in main.dart
class QuizBrain {
  //in dart, can make something private by adding '_' before the name
  //this shows the use of encapsulation in OOP, so that the quesBank is now a completely separated thing and main.dart can't change its contents
  //this increases privacy and reduces chances of error, as now we are using getters to access the values.
  List<Ques> _question = [
    Ques('You can lead a cow down stairs but not up stairs.', false),
    Ques('Approximately one quarter of human bones are in the feet.', true),
    Ques('A slug\'s blood is green.', false),
    Ques('Some cats are actually allergic to humans', true),
    Ques('You can lead a cow down stairs but not up stairs.', false),
    Ques('Approximately one quarter of human bones are in the feet.', true),
    Ques('A slug\'s blood is green.', true),
    Ques('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Ques('It is illegal to pee in the Ocean in Portugal.', true),
    Ques(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Ques(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Ques(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Ques(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Ques('Google was originally called \"Backrub\".', true),
    Ques(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Ques(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  //made these private so that main.dart can't accidently change it and crash the app
  int _totalQues;
  int _currentQues;
  bool finished;

  QuizBrain() {
    this._totalQues = _question.length;
    this._currentQues = 0;
    this.finished = false;
  }

  String getCurrentQues() => this._question[_currentQues].question;
  bool getCurrentAns() => this._question[_currentQues].answer;
  bool getFinished() => this.finished;

  void refresh() {
    this._currentQues = 0;
    this.finished = false;
  }

  void nextQues() {
    if (this._currentQues < this._totalQues - 1)
      _currentQues = _currentQues + 1;
    else {
      this.finished = true;
    }
  }
}

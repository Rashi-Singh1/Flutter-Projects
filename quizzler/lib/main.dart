import 'package:flutter/material.dart';
import 'package:quizzler/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = new QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ansHistory = [];

  void addIcon(bool ans) {
    if (ans != quizBrain.getCurrentAns()) {
      print('User got it wrong');
      ansHistory.insert(
          0,
          Icon(
            Icons.close,
            color: Colors.red,
          ));
    } else {
      print('User got it right');
      ansHistory.insert(
          0,
          Icon(
            Icons.check,
            color: Colors.green,
          ));
    }
    quizBrain.nextQues();
    if (quizBrain.getFinished() == true) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "CONGRATULATIONS",
        desc: "The quiz has ended",
        buttons: [
          DialogButton(
              width: 120,
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  quizBrain.refresh();
                  ansHistory.clear();
                });
              })
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
//                'This is where the question text will go.',
                quizBrain.getCurrentQues(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //can simply call addIcon and put setState out of build as well (around the code to change question and addicon)
                setState(() {
                  addIcon(true);
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //can simply call addIcon and put setState out of build as well (around the code to change question and addicon)
                setState(() {
                  addIcon(false);
                });
                //The user picked false.
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Row(children: ansHistory),
          controller: ScrollController(
            keepScrollOffset: true,
            initialScrollOffset: 0.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

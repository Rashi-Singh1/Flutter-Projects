import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final String data = 'Top Secret data';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(data),
          ),
          body: Column(
            children: <Widget>[
              MyText(),
              Level1(),
            ],
          ),
        ),
      ),
    );
  }
}

//now no need to change the state/rebuild the intermediate levels
class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //this would allow the Text to be initialized with the value of data, but not be rebuild, every time data is changed
    return Text(Provider.of<Data>(context, listen: false).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        //TODO: move this value to data inside Data class
        Provider.of<Data>(context).changeString(value);
      },
    );
  }
}

//to notify listeners of update in this class
//ChangeNotifier does not come with Provider Package
class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;

    //Very Very imp...for change in the data being listened
    notifyListeners();
  }
}

void main() => runApp(MyApp());

//For this structure...need to update the state using Provider Package
//                                   MyApp
//            myText                                    Level1
//
//                                                      Level2
//                                        MyTextField            Level3
//(need update in MyTextField field to reflect at level3 and MyText)

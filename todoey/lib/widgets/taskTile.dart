import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('This is a task'),
          TaskCheckBox(),
        ],
      ),
    );
  }
}

class TaskCheckBox extends StatefulWidget {
  const TaskCheckBox({
    Key key,
  }) : super(key: key);

  @override
  _TaskCheckBoxState createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
  bool isChecked = false;
  //this will act as a local variable for each checkbox
  //Note that this is a local value, so if i have to know status of checkbox, for example to strikeThrough the to-Do, then need it at a higher level
  //consider the note below

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value;
          });
        },
        activeColor: Colors.lightBlueAccent,
      ),
      height: 24.0,
      width: 24.0,
    );
  }
}

//for an individual taskTile :
//in this scenario, can not strikeThrough the text
//                                     taskTile( stLess )
//                    Text                                        TaskCheckBox
//                                                                  isChecked

//for an individual taskTile :
//in this scenario, can not strikeThrough the text
//                                     taskTile( stLess )
//                                        (isChecked)
//This isChecked affects both the text ki state and checkBox ki state, also, this makes the taskTile a stFul widget
//                    Text                                        TaskCheckBox
//

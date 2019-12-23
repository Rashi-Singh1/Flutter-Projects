import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  //its only task is to use State (which can be changed) to create the stFul widget

  @override
  _TaskTileState createState() => _TaskTileState();
}

//this state is what actually changes, hence we use the setState function
class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  void toggleCheckBox(bool checkBoxState) {
    setState(() {
      isChecked = checkBoxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: ListTile(
        trailing: TaskCheckBox(
          isChecked: isChecked,
          onChanged: toggleCheckBox,
        ),
        title: Text(
          'This is a task',
          style: TextStyle(
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none),
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function onChanged;
  TaskCheckBox({@required this.isChecked, @required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Checkbox(
        value: isChecked,
        onChanged: onChanged,
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

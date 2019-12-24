import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function onCheckBoxChanged;
  final Function onTap;

  TaskTile(
      {@required this.taskTitle,
      this.isChecked,
      this.onCheckBoxChanged,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: ListTile(
        trailing: SizedBox(
          child: Checkbox(
            //re-positioned it here, now that both are stateless widgets, it does not make sense to separate this
            //earlier our TaskTile was stFul and checkBox stLess
            //as change happened for the complete tile
            value: this.isChecked,
            onChanged: this.onCheckBoxChanged,
            activeColor: Colors.lightBlueAccent,
          ),
          height: 24.0,
          width: 24.0,
        ),
        title: Text(
          this.taskTitle,
          style: TextStyle(
              decoration: this.isChecked
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
      ),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/taskTile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //using ListView builder allows to only build what is visible on the screen (especially useful in cases of large lists)
    //the context tells where the children where the parent is in the widget tree

    //now this consumer will listen to the changes in TaskData, instead of calling Provider.of<TaskData>(context) again and again
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.getName(index),
              isChecked: taskData.getIsDone(index),
              onCheckBoxChanged: (checkBoxState) {
                taskData.doToggle(index);
              },
              onTap: () {
                taskData.doToggle(index);
              },
              onLongPress: () {
                taskData.delete(index);
              },
            );
          },
          itemCount: taskData.taskCount,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
        );
      },
    );
  }
}

//                                     TasksScreen( stLess )
//                    AddTaskScreen                                ListView with (tasks - List)
//                      TextField                                           taskTiles
//                                                                         Task (Object)
//therefore need to move up the list (tasks), to be able to add Tasks via AddTaskScreen, ow need to pass perimeters via TasksScreen

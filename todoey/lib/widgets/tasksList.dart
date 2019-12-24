import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/taskTile.dart';

//made this stateful, so that it can update when a new to-do is added
class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  List<TaskTile> getTasks() {
    List<TaskTile> taskTiles = List();
    for (int i = 0; i < tasks.length; i++) {
      taskTiles.add(
        TaskTile(
          taskTitle: tasks[i].name,
          isChecked: tasks[i].isDone,
        ),
      );
    }
    return taskTiles;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 24.0),
      children: getTasks(),
    );
  }
}

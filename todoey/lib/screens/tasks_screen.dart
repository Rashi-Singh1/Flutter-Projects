import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/curvedContainer.dart';
import 'package:todoey/widgets/taskTile.dart';
import 'package:todoey/widgets/tasksList.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  String newTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              onTap: () {
                setState(() {
                  tasks.add(
                    Task(
                      name: newTask,
                    ),
                  );
                  print(tasks.length);
                });
              },
              onTextFieldChange: (value) => newTask = value,
            ),
            backgroundColor: Colors.transparent,
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 60.0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 38.0,
                      color: Colors.lightBlueAccent,
                    ),
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    tasks.length.toString() + ' Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CurvedContainer(
                child: TasksList(
                  builder: (context, index) {
                    return TaskTile(
                      taskTitle: tasks[index].name,
                      isChecked: tasks[index].isDone,
                      onCheckBoxChanged: (checkBoxState) {
                        setState(() {
                          tasks[index].toggleDone();
                        });
                      },
                      onTap: () {
                        setState(() {
                          tasks[index].toggleDone();
                        });
                      },
                    );
                  },
                  length: tasks.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

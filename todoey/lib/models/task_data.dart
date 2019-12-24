import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  //made this private so that always use a function to access (do not forget to use notifyListeners)
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskCount => _tasks.length;

  void addTask(String value) {
    _tasks.add(Task(
      name: value,
    ));
    notifyListeners();
  }

  void delete(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  String getName(int index) => _tasks[index].name;

  bool getIsDone(int index) => _tasks[index].isDone;

  void doToggle(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}

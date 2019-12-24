import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final Function builder;
  final int length;

  TasksList({@required this.builder, @required this.length});

  @override
  Widget build(BuildContext context) {
    //using ListView builder allows to only build what is visible on the screen (especially useful in cases of large lists)
    //the context tells where the children where the parent is in the widget tree
    return ListView.builder(
      itemBuilder: this.builder,
      itemCount: length,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
    );
  }
}

//                                     TasksScreen( stLess )
//                    AddTaskScreen                                ListView with (tasks - List)
//                      TextField                                           taskTiles
//                                                                         Task (Object)
//therefore need to move up the list (tasks), to be able to add Tasks via AddTaskScreen, ow need to pass perimeters via TasksScreen

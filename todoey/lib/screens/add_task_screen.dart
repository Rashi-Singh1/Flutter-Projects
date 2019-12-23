import 'package:flutter/material.dart';
import 'package:todoey/widgets/curvedContainer.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedContainer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 8.0, right: 0.0, top: 8.0, bottom: 3.0),
                  child: Icon(
                    Icons.send,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

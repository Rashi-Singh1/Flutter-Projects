void main() {
  performTasks();
}

void performTasks() {
  task1();
  String cur = task2();
  task3(cur);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

String task2() {
  Duration threeseconds = Duration(seconds: 3);
  String result;
  Future.delayed(threeseconds, () {
    //this is an async function that can run in background and the function inside it will run after the said task is complete
    //this is basically a function that occurs after the given duration (creates a future)
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}

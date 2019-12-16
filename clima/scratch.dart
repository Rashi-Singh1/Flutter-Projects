void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2() {
  Duration threeseconds = Duration(seconds: 3);
//  sleep(threeseconds);
  Future.delayed(threeseconds, () {
    //this is an async function that can run in background and the function inside it will run after the said task is complete
    //this is basically a function that occurs after the given duration (creates a future)
    String result = 'task 2 data';
    print('Task 2 complete');
  });
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String cur = await task2(); //here also, await this task, then go fwd
  task3(cur);
  task4();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() async {
  Duration threeseconds = Duration(seconds: 3);
  String result;

  await Future.delayed(threeseconds, () {
    //this is an async function that can run in background and the function inside it will run after the said task is complete
    //this is basically allows a function to occurs after the given duration (creates a future), while next stmts are allowed to be executed
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result; //this is returned after await, if we only had future, then this stmt would've occured before result would've been calculated
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}

void task4() {
  String result = 'task 4 data';
  print('Task 4 complete');
}

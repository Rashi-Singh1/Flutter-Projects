//this shows how functions can be stored as class properties
class Car {
  Function drive;
  Car(this.drive);
}

void slowDrive() {
  print('This car is driving slowly');
}

void fastDrive() {
  print('This car is driving super fast');
}

void main() {
  //here just passing the name, ow it will run the function
  Car myCar = Car(slowDrive);
  print(myCar.drive); //this prints the name slowDrive
  myCar.drive();

  myCar.drive = fastDrive;
  myCar.drive();

  //this shows how functions can be passed as parameters
  int result = calculator(1, 2, multiply);
  print(result);
}

int add(int a, int b) => a + b;
int multiply(int a, int b) => a * b;
int calculator(int a, int b, Function func) {
  return func(a, b);
}

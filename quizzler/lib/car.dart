//this example shows inheritance in action
//there is no need to rewrite excessive amounts of code, as child class inherits all properties and attributes of parent class
class Car {
  int totalSeats;
  int totalAirbags;
  String state;

  Car(int totalSeats, int totalAirBags) {
    this.totalSeats = totalSeats;
    this.totalAirbags = totalAirBags;
    this.state = 'new';
  }

  Car.named(int totalSeats, int totalAirBags) {
    this.totalSeats = totalSeats;
    this.totalAirbags = totalAirBags;
    this.state = 'old';
  }

  Car.empty();

  void drive() => print('Wheels turn');
}

class NewCar extends Car {
  NewCar(int a, int b) : super(a, b);
}

class OldCar extends Car {
  OldCar(int c, int d) : super.named(c, d);
}

class ElectricCar extends Car {
  int totalBattery;
  int curBattery;

  ElectricCar(int a, int b, int curBattery, int totalBattery)
      : this.curBattery = curBattery,
        this.totalBattery = totalBattery,
        super(a, b);

  void recharge() => this.curBattery = this.totalBattery;
}

//the next two classes show polymorphism in action
//i.e. not only do we inherit, but we can also improve or override the parent's functions
class LevitatingCar extends Car {
  LevitatingCar(int totalSeats, int totalAirBags)
      : super(totalSeats, totalAirBags);

  @override
  void drive() => print(
      'gliding smoothly'); //here we are completely making its drive function diff
}

class SelfDrivingCar extends Car {
  String dest;

  SelfDrivingCar(int totalSeats, int totalAirBags, String dest)
      : this.dest = dest,
        super(totalSeats, totalAirBags);

  @override
  void drive() {
    super.drive(); //here we are adding onto parent's drive function
    print('Going towards $dest');
  }
}

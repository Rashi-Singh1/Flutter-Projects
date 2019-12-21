//example to us mixins

class Animal {
  void move() {
    print('moved position');
  }
}

class Fish extends Animal {
  @override
  void move() {
    super.move();
    print('by swimmnig');
  }
}

class Bird extends Animal {
  @override
  void move() {
    super.move();
    print('by flying');
  }
}

//can't extend from multiple classes, even tho can perform all types of move
//even if it was able to extend multiple, which move would it use?
//**********class Duck extends Animal,Fish,Bird*************

mixin canFly {
  void fly() {
    print('moved by flying');
  }
}

mixin canSwim {
  void swim() {
    print('moved by swimming');
  }
}

class Duck extends Animal with canFly, canSwim {}

void main() {
  Duck donald = new Duck();
  donald.fly();
  donald.swim();
  donald.move();
}

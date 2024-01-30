void main() {
  Walkable b;
}

abstract interface class BasicHumanInterface {
  void sleep();
  void eat();
}

abstract interface class Walkable extends BasicHumanInterface {
  void walk();
}

abstract interface class Workable extends Walkable {
  void work();
}

abstract interface class EducationInterface {
  void study();
  void teach();
}

class Child implements BasicHumanInterface {
  @override
  void eat() {
    // TODO: implement eat
  }

  @override
  void sleep() {
    // TODO: implement sleep
  }
}

class Teacher
    implements BasicHumanInterface, Walkable, Workable, EducationInterface {
  @override
  void eat() {
    // TODO: implement eat
  }

  @override
  void sleep() {
    // TODO: implement sleep
  }

  @override
  void study() {
    // TODO: implement study
  }

  @override
  void teach() {
    // TODO: implement teach
  }

  @override
  void walk() {
    // TODO: implement walk
  }

  @override
  void work() {
    // TODO: implement work
  }
}

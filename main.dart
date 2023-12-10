import 'dart:ffi';

abstract class Role {
  void displayRole();
}

class Person implements Role {
  String _name;
  int _age;
  String _address;
  Person(this._name, this._age, this._address);
  @override
  void displayRole() {
    print("Role:Person");
  }

  void setName(String name) {
    _name = name;
  }

  void setAge(int age) {
    _age = age;
  }

  void setAddress(String address) {
    _address = address;
  }

  String getName() {
    return _name;
  }

  int getAge() {
    return _age;
  }

  String getAddress() {
    return _address;
  }
}

class Student extends Person {
  late String studentID;
  late Float grade;
  List<int> courseScores;
  Student(String name, int age, String address, this.courseScores)
      : super(name, age, address) {
    super.setName(name);
    super.setAge(age);
    super.setAddress(address);
    name = super.getName();
    age = super.getAge();
    address = super.getAddress();
  }

  @override
  void displayRole() {
    print("Role:Student");
  }

  double getAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    double sum = 0;
    for (int i in courseScores) {
      sum = sum + i;
    }
    return sum / courseScores.length;
  }
}

class Teacher extends Person {
  late String teacherID;
  late List<String> courseTaught;
  Teacher(String name, int age, String address, this.courseTaught)
      : super(name, age, address) {
    super.setName(name);
    super.setAge(age);
    super.setAddress(address);
    name = super.getName();
    age = super.getAge();
    address = super.getAddress();
  }

  @override
  void displayRole() {
    print("Role:Teacher");
  }

  void DisplayCourse() {
    print("\nCourse Taught:\n");
    for (String j in courseTaught) {
      print("-$j\n");
    }
  }
}

void main() {
  var student = Student(
    'John Doe',
    20,
    '123 Main St',
    [90, 85, 82],
  );
  var teacher = Teacher(
    'Mrs. Smith',
    35,
    '456 Oak St',
    ['Math', 'English', 'Bangla'],
  );

  print('Student Information:\n');
  student.displayRole();

  print("\nName: " + student.getName());
  print("\nAge: ${student.getAge()}");
  print("\nAddress: " + student.getAddress());
  print("\nAverage score: ${student.getAverageScore().toStringAsFixed(2)}");
  print("\n\n");
  print('Teacher Information:\n');
  teacher.displayRole();
  print("\nName: " + teacher.getName());
  print("\nAge: ${teacher.getAge()}");
  print("\nAddress: " + teacher.getAddress());
  teacher.DisplayCourse();
}

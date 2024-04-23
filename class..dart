import 'dart:io';

abstract class Academic {
  // Interface method
  void study();
}

class Person {
  // Fields
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  // Method
  void introduce() {
    print("Hi, I'm $name, and I'm $age years old.");
  }
}

class Student extends Person implements Academic {
  // Field
  String major;

  // Constructor
  Student(String name, int age, this.major) : super(name, age);

  // Override introduce method
  @override
  void introduce() {
    print("Hi, I'm $name, a $major major, and I'm $age years old.");
  }

  // Implement study method from Academic interface
  @override
  void study() {
    print("$name is studying $major.");
  }

  // Method demonstrating the use of a loop
  void completeAssignments(int numberOfAssignments) {
    for (int i = 1; i <= numberOfAssignments; i++) {
      print("$name completed assignment $i.");
    }
  }
}

void main() async {
  // Read data from a file to initialize a Student instance
  final file = File('student_data.txt');
  final lines = await file.readAsLines();
  
  // Assuming the file has lines with name, age, and major
  String name = lines[0];
  int age = int.parse(lines[1]);
  String major = lines[2];

  // Create a Student instance with the data from the file
  Student student = Student(name, age, major);

  // Call methods on the Student instance
  student.introduce();
  student.study();
  student.completeAssignments(3);  // Demonstrate the use of a loop
}

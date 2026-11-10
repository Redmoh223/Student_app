import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Student {
  final String fullName;
  final String filiere;
  const Student({required this.fullName, required this.filiere});
}

const students = [
  Student(fullName: 'Sara', filiere: 'GINF'),
  Student(fullName: 'Omar', filiere: 'IA'),
  Student(fullName: 'Yassine', filiere: 'ROC'),
  Student(fullName: 'Salma', filiere: 'IRSI'),
];

class StudentCard extends StatelessWidget {
  final Student student;
  const StudentCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(student.fullName),
        subtitle: Text(student.filiere),
      ),
    );
  }
}

class StudentsList extends StatelessWidget {
  final List<Student> students;
  const StudentsList({super.key, required this.students});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return StudentCard(student: students[index]);
      },
    );
  }
}

class StudentsGrid extends StatelessWidget {
  final List<Student> students;
  const StudentsGrid({super.key, required this.students});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: students.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return StudentCard(student: students[index]);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('ENIAD etudiant')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return StudentsList(students: students);
              }
              return StudentsGrid(students: students);
            },
          ),
        ),
      ),
    );
  }
}

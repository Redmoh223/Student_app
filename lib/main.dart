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
  Student(fullName: 'Yassinee', filiere: 'ROC'),
  Student(fullName: 'Salma', filiere: 'IRSI'),
];

class InfoBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoBadge({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        InfoBadge(icon: Icons.code, text: 'Flutter'),
        InfoBadge(icon: Icons.storage, text: 'Base de donnees'),
        InfoBadge(icon: Icons.cloud, text: 'Cloud'),
      ],
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;
  const StudentCard({super.key, required this.student});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(student.fullName),
        subtitle: Text(student.filiere),
        trailing: const Icon(Icons.chevron_right),
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
        appBar: AppBar(
          leading: const Icon(Icons.school, color: Colors.blue),
          title: const Text('ENIAD etudiant'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // --- Bloc de bienvenue ajouté ici ---
              const Row(
                children: [
                  CircleAvatar(radius: 28, child: Icon(Icons.person, size: 30)),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenue',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          Chip(
                            avatar: Icon(Icons.code, size: 18),
                            label: Text('Flutter'),
                          ),
                          Chip(
                            avatar: Icon(Icons.storage, size: 18),
                            label: Text('Base de donnees'),
                          ),
                          Chip(
                            avatar: Icon(Icons.cloud, size: 18),
                            label: Text('Cloud'),
                          ),
                          Chip(
                            avatar: Icon(Icons.security, size: 18),
                            label: Text('Securite'),
                          ),
                        ],
                      ),
                      Text(
                        'Mohamed Goumané', // Modifie avec ton nom si tu veux
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('GINF'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espace entre le bloc et la liste
              // --- Liste / Grille des étudiants ---
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return StudentsList(students: students);
                    }
                    return StudentsGrid(students: students);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

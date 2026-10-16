
import 'package:flutter/material.dart';

void main() {
  runApp(const DirectoryApp());
}

// Student is a data model, not a widget, so it stores student information.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// DirectoryApp is stateless because the app theme and home screen are fixed.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Customization 1: Use a blue color scheme throughout the app.
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

// DirectoryScreen is stateless because the displayed student list is fixed.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  static const List<Student> students = [
    Student(
      name: 'Joseph Dablo',
      course: 'BS Information Technology',
      yearLevel: 3,
      email: 'joseph@example.com',
    ),
    Student(
      name: 'Jian Bakolpo',
      course: 'BS Computer Science',
      yearLevel: 2,
      email: 'jian@example.com',
    ),
    Student(
      name: 'Charels Bagondo',
      course: 'BS Information Systems',
      yearLevel: 3,
      email: 'charles@example.com',
    ),
    Student(
      name: 'Joseph Khaliffa',
      course: 'BS Information Technology',
      yearLevel: 4,
      email: 'josephk@example.com',
    ),
    Student(
      name: 'Josephine Lore',
      course: 'BS Computer Science',
      yearLevel: 2,
      email: 'josephine@example.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 8),
          ...students.map(
            (student) => StudentCard(student: student),
          ),
        ],
      ),
    );
  }
}

// SectionHeader is stateless because its title is provided by its parent.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Divider(thickness: 1.5),
      ],
    );
  }
}

// InfoRow is stateless because its icon and text are passed by its parent.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// StudentCard is stateless because it displays the supplied Student data.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customization 2: Give each student card rounded corners.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        // Customization 3: Add comfortable spacing inside each card.
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              // Customization 4: Use a light blue avatar background.
              backgroundColor: Colors.blue.shade100,
              child: Text(
                student.name[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    // Customization 5: Emphasize the student's name.
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(student.course),
                  const SizedBox(height: 10),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  const SizedBox(height: 6),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

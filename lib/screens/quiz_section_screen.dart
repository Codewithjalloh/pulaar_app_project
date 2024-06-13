import 'package:flutter/material.dart';
import '../model/section.dart';
import '../screens/quiz_screen.dart';

class QuizSectionScreen extends StatelessWidget {
  final List<Section> sections = [
    Section(
      title: '1. Greetings',
      subtitle: 'On jaaraama',
      filename: '1_greetings.json',
      icon: Icons.pan_tool,
      phrases: [],
    ),
    Section(
      title: '2. Introductions',
      subtitle: 'Mido faalaa jommbude maa',
      filename: '2_introduction.json',
      icon: Icons.loop,
      phrases: [],
    ),
    // Add more sections as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Sections'),
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return ListTile(
            leading: Icon(section.icon, size: 50),
            title: Text(section.title, style: TextStyle(fontSize: 25)),
            subtitle: Text(section.subtitle, style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScreen(
                    title: section.title,
                    filename: section.filename,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

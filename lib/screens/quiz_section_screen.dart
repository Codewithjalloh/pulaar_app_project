import 'package:flutter/material.dart';
import '../services/section_service.dart';
import '../model/section.dart';
import 'quiz_screen.dart';

class QuizSectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Sections'),
      ),
      body: FutureBuilder<List<Section>>(
        future: SectionService.loadSections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final sections = snapshot.data ?? [];
          return ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              return ListTile(
                leading: Icon(section.icon),
                title: Text(section.title),
                subtitle: Text(section.subtitle),
                onTap: () async {
                  final phrases =
                      await SectionService.loadPhrases(section.filename);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        title: section.title,
                        phrases: phrases,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

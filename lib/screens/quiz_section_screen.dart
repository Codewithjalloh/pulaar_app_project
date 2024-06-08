import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import '../model/section.dart';
import 'quiz_screen.dart';

class QuizSectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quiz Section'),
      ),
      drawer: CustomDrawer(
        favoritePhrases: [],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;
          return ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              return Column(
                children: [
                  ListTile(
                    leading: Icon(section.icon, size: isPortrait ? 50 : 40),
                    title: Text(
                      section.title,
                      style: TextStyle(
                        fontSize: isPortrait ? 25 : 20,
                      ),
                    ),
                    subtitle: Text(
                      section.subtitle,
                      style: TextStyle(
                        fontSize: isPortrait ? 20 : 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            title: section.title + ' Quiz',
                            filename: section.filename,
                          ),
                        ),
                      );
                    },
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/section.dart';
import '../model/phrase.dart';
import 'quiz_screen.dart';

class QuizSectionScreen extends StatelessWidget {
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
            leading: Icon(section.icon),
            title: Text(section.title),
            subtitle: Text(section.subtitle),
            onTap: () async {
              final phrases = await _loadPhrases(section.filename);
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
      ),
    );
  }

  Future<List<Phrase>> _loadPhrases(String filename) async {
    final String response = await rootBundle.loadString('assets/$filename');
    final data = await json.decode(response) as List;
    return data.map((json) => Phrase.fromJson(json)).toList();
  }
}

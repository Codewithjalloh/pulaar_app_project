import 'package:flutter/material.dart';
import '../model/phrase.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final List<Phrase> phrases;

  QuizScreen({required this.title, required this.phrases});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    final phrase = widget.phrases[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              phrase.english,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (_showAnswer)
              Text(
                phrase.pulaar,
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showAnswer = !_showAnswer;
                    });
                  },
                  child: Text(_showAnswer ? 'Hide Answer' : 'Show Answer'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex < widget.phrases.length - 1) {
                      setState(() {
                        _currentIndex++;
                        _showAnswer = false;
                      });
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

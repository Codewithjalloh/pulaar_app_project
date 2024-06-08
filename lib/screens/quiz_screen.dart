import 'package:flutter/material.dart';
import 'dart:math';
import '../model/phrase.dart';
import '../services/phrase_service.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final String filename;

  QuizScreen({required this.title, required this.filename});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PhraseService phraseService = PhraseService();
  final Random random = Random();
  List<Phrase> _phrases = [];
  List<Phrase> _quizQuestions = [];
  List<String> _staticOptions = [];
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;
  int _incorrectAnswers = 0;
  String? _selectedOption;
  String _feedbackMessage = '';

  @override
  void initState() {
    super.initState();
    _loadPhrases();
  }

  Future<void> _loadPhrases() async {
    List<Phrase> phrases = await phraseService.loadPhrases(widget.filename);
    setState(() {
      _phrases = phrases;
      _generateQuizQuestions();
      _generateStaticOptions();
    });
  }

  void _generateQuizQuestions() {
    _quizQuestions = List<Phrase>.from(_phrases)..shuffle(random);
    _quizQuestions = _quizQuestions.take(10).toList();
  }

  void _generateStaticOptions() {
    final Set<String> options = Set<String>();
    while (options.length < 3) {
      final randomOption = _phrases[random.nextInt(_phrases.length)].pulaar;
      options.add(randomOption);
    }
    _staticOptions = options.toList();
  }

  void _handleAnswer(bool isCorrect) {
    if (isCorrect) {
      _correctAnswers++;
      _feedbackMessage = 'Correct!';
    } else {
      _incorrectAnswers++;
      _feedbackMessage = 'Wrong!';
    }

    setState(() {});

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _selectedOption = null;
        _feedbackMessage = '';
        if (_currentQuestionIndex < _quizQuestions.length - 1) {
          _currentQuestionIndex++;
        } else {
          _showResultsDialog();
        }
      });
    });
  }

  void _showResultsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You got $_correctAnswers correct and $_incorrectAnswers incorrect answers.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: _correctAnswers / 10,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Restart'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  _correctAnswers = 0;
                  _incorrectAnswers = 0;
                  _generateQuizQuestions();
                  _generateStaticOptions();
                });
              },
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_quizQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentPhrase = _quizQuestions[_currentQuestionIndex];
    final correctAnswer = currentPhrase.pulaar;
    final options = List<String>.from(_staticOptions);

    // Add the correct answer to the options list if not already present
    if (!options.contains(correctAnswer)) {
      options.add(correctAnswer);
    }

    // Shuffle the options once
    final displayedOptions = List<String>.from(options)..shuffle(random);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Score: $_correctAnswers',
                  style: TextStyle(
                      fontSize: isPortrait ? 20 : 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: (_currentQuestionIndex + 1) / _quizQuestions.length,
                  backgroundColor: Colors.grey[200],
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                Text(
                  'Translate to Pulaar:',
                  style: TextStyle(
                      fontSize: isPortrait ? 20 : 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final textScaleFactor = constraints.maxWidth / 350;
                      return Text(
                        currentPhrase.english,
                        style: TextStyle(
                          fontSize: 24 * textScaleFactor,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: displayedOptions.map((option) {
                    Color? buttonColor;
                    if (_selectedOption != null) {
                      if (option == correctAnswer) {
                        buttonColor = Colors.green;
                      } else if (option == _selectedOption) {
                        buttonColor = Colors.red;
                      }
                    }
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          textStyle: TextStyle(fontSize: 18),
                          backgroundColor: buttonColor,
                        ),
                        onPressed: _selectedOption == null
                            ? () {
                                setState(() {
                                  _selectedOption = option;
                                  _handleAnswer(option == correctAnswer);
                                });
                              }
                            : null,
                        child: Text(option),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                if (_feedbackMessage.isNotEmpty)
                  Text(
                    _feedbackMessage,
                    style: TextStyle(
                      fontSize: isPortrait ? 24 : 22,
                      fontWeight: FontWeight.bold,
                      color: _feedbackMessage == 'Correct!'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                SizedBox(height: 10),
                Text(
                  'Question ${_currentQuestionIndex + 1} of ${_quizQuestions.length}',
                  style: TextStyle(
                      fontSize: isPortrait ? 16 : 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

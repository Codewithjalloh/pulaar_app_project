import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/phrase.dart';

class PhraseDetailScreen extends StatefulWidget {
  final String title;
  final String filename;

  PhraseDetailScreen({required this.title, required this.filename});

  @override
  _PhraseDetailScreenState createState() => _PhraseDetailScreenState();
}

class _PhraseDetailScreenState extends State<PhraseDetailScreen> {
  List<Phrase> phrases = [];

  @override
  void initState() {
    super.initState();
    _loadPhrases();
  }

  Future<void> _loadPhrases() async {
    final String response = await rootBundle.loadString(widget.filename);
    final data = await json.decode(response);
    setState(() {
      phrases = (data as List).map((i) => Phrase.fromJson(i)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          final phrase = phrases[index];
          return ListTile(
            title: Text(phrase.english),
            subtitle: Text(phrase.pulaar),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}

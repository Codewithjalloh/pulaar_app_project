import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import '../model/phrase.dart';
import '../services/favorite_phrases_provider.dart';
import 'phrase_detail_screen.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  final String filename;

  CategoryScreen({required this.title, required this.filename});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Phrase> phrases = [];

  @override
  void initState() {
    super.initState();
    _loadPhrases();
  }

  Future<void> _loadPhrases() async {
    final String response = await rootBundle.loadString(widget.filename);
    final data = await json.decode(response) as List;
    setState(() {
      phrases = data.map((phrase) => Phrase.fromJson(phrase)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritePhrasesProvider =
        Provider.of<FavoritePhrasesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          final phrase = phrases[index];
          final isFavorite = favoritePhrasesProvider.isFavorite(phrase);

          return ListTile(
            title: Text(phrase.english),
            subtitle: Text(phrase.pulaar),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  favoritePhrasesProvider.toggleFavorite(phrase);
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhraseDetailScreen(phrase: phrase),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

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
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          final phrase = phrases[index];
          final isFavorite = favoritePhrasesProvider.isFavorite(phrase);

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  phrase.english,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  phrase.pulaar,
                  style: TextStyle(
                    fontSize: 20, // Increased font size
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.blueAccent, // Changed color to make it stand out
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
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
              ),
            ),
          );
        },
      ),
    );
  }
}

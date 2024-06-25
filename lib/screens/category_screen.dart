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

  // Constructor to accept title and filename
  CategoryScreen({required this.title, required this.filename});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Phrase> phrases = [];

  @override
  void initState() {
    super.initState();
    // Load phrases when the widget is initialized
    _loadPhrases();
  }

  // Function to load phrases from the JSON file
  Future<void> _loadPhrases() async {
    final String response = await rootBundle.loadString(widget.filename);
    final data = await json.decode(response) as List;
    setState(() {
      phrases = data.map((phrase) => Phrase.fromJson(phrase)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the instance of FavoritePhrasesProvider from the context
    final favoritePhrasesProvider =
        Provider.of<FavoritePhrasesProvider>(context);

    return Scaffold(
      // Custom AppBar with white background and black text
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      // ListView to display the phrases
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
                // Display English phrase
                title: Text(
                  phrase.english,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // Display Pulaar phrase
                subtitle: Text(
                  phrase.pulaar,
                  style: const TextStyle(
                    fontSize: 20, // Increased font size
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.blueAccent, // Changed color to make it stand out
                  ),
                ),
                // Favorite button
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
                // Navigate to PhraseDetailScreen on tap
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

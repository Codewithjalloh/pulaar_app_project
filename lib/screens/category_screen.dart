import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/phrase.dart';
import 'phrase_detail_screen.dart';
import 'package:flutter/services.dart' show rootBundle;

class CategoryScreen extends StatefulWidget {
  final String title;
  final String filename;
  final Function(Phrase) toggleFavorite;
  final List<Phrase> favoritePhrases;

  CategoryScreen({
    required this.title,
    required this.filename,
    required this.toggleFavorite,
    required this.favoritePhrases,
  });

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Phrase> _phrases = [];

  @override
  void initState() {
    super.initState();
    _loadPhrases();
  }

  Future<void> _loadPhrases() async {
    final String response =
        await rootBundle.loadString('assets/${widget.filename}');
    final data = await json.decode(response);
    setState(() {
      _phrases = (data as List).map((i) => Phrase.fromJson(i)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _phrases.isEmpty
          ? Center(child: CircularProgressIndicator())
          : OrientationBuilder(
              builder: (context, orientation) {
                final isPortrait = orientation == Orientation.portrait;

                return ListView.builder(
                  itemCount: _phrases.length,
                  itemBuilder: (context, index) {
                    final phrase = _phrases[index];
                    final isFavorite = widget.favoritePhrases.contains(phrase);

                    return ListTile(
                      title: Text(
                        phrase.english,
                        style: TextStyle(fontSize: isPortrait ? 18 : 16),
                      ),
                      subtitle: Text(
                        phrase.pulaar,
                        style: TextStyle(fontSize: isPortrait ? 16 : 14),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.toggleFavorite(phrase);
                          });
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PhraseDetailScreen(phrase: phrase),
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

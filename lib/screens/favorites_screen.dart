import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import '../model/phrase.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Phrase> favoritePhrases;

  FavoritesScreen({required this.favoritePhrases});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Phrases'),
      ),
      drawer: CustomDrawer(
        favoritePhrases: [],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;

          return ListView.builder(
            itemCount: favoritePhrases.length,
            itemBuilder: (context, index) {
              final phrase = favoritePhrases[index];

              return ListTile(
                title: Text(
                  phrase.english,
                  style: TextStyle(fontSize: isPortrait ? 18 : 16),
                ),
                subtitle: Text(
                  phrase.pulaar,
                  style: TextStyle(fontSize: isPortrait ? 16 : 14),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

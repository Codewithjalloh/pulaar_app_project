import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_drawer.dart';
import '../services/favorite_phrases_provider.dart';
import '../model/phrase.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Phrases'),
      ),
      drawer: CustomDrawer(),
      body: Consumer<FavoritePhrasesProvider>(
        builder: (context, favoritePhrasesProvider, child) {
          final favoritePhrases = favoritePhrasesProvider.favoritePhrases;
          return OrientationBuilder(
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
          );
        },
      ),
    );
  }
}

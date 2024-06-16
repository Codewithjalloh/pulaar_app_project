import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/phrase.dart';
import '../services/favorite_phrases_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritePhrasesProvider =
        Provider.of<FavoritePhrasesProvider>(context);
    final favoritePhrases = favoritePhrasesProvider.favoritePhrases;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Phrases'),
      ),
      body: ListView.builder(
        itemCount: favoritePhrases.length,
        itemBuilder: (context, index) {
          final phrase = favoritePhrases[index];

          return ListTile(
            title: Text(phrase.english),
            subtitle: Text(phrase.pulaar),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                favoritePhrasesProvider.toggleFavorite(phrase);
              },
            ),
          );
        },
      ),
    );
  }
}

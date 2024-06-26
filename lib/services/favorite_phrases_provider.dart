import 'package:flutter/material.dart';
import '../model/phrase.dart';

class FavoritePhrasesProvider extends ChangeNotifier {
  // List to hold favorite phrases
  List<Phrase> _favoritePhrases = [];

  // Getter to access the list of favorite phrases
  List<Phrase> get favoritePhrases => _favoritePhrases;

  // Method to add or remove a phrase from favorites
  void toggleFavorite(Phrase phrase) {
    // Check if the phrase is already in favorites
    if (_favoritePhrases.contains(phrase)) {
      // Remove the phrase from favorites
      _favoritePhrases.remove(phrase);
    } else {
      // Add the phrase to favorites
      _favoritePhrases.add(phrase);
    }
    // Notify listeners about the change
    notifyListeners();
  }

  // Method to check if a phrase is in favorites
  bool isFavorite(Phrase phrase) {
    return _favoritePhrases.contains(phrase);
  }
}

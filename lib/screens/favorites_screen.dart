import 'package:flutter/material.dart';
import '../model/phrase.dart';

class FavoritePhrasesProvider extends ChangeNotifier {
  List<Phrase> _favoritePhrases = [];

  List<Phrase> get favoritePhrases => _favoritePhrases;

  void toggleFavorite(Phrase phrase) {
    if (_favoritePhrases.contains(phrase)) {
      _favoritePhrases.remove(phrase);
    } else {
      _favoritePhrases.add(phrase);
    }
    notifyListeners();
  }

  bool isFavorite(Phrase phrase) {
    return _favoritePhrases.contains(phrase);
  }
}

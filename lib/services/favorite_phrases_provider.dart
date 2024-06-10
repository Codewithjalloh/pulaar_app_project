import 'package:flutter/material.dart';
import 'package:pulaar/model/phrase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoritePhrasesProvider with ChangeNotifier {
  List<Phrase> _favoritePhrases = [];

  List<Phrase> get favoritePhrases => _favoritePhrases;

  FavoritePhrasesProvider() {
    _loadFavorites();
  }

  void toggleFavorite(Phrase phrase) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favoritePhrases.contains(phrase)) {
      _favoritePhrases.remove(phrase);
    } else {
      _favoritePhrases.add(phrase);
    }
    List<String> favoriteStrings =
        _favoritePhrases.map((phrase) => jsonEncode(phrase.toJson())).toList();
    await prefs.setStringList('favoritePhrases', favoriteStrings);
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoriteStrings = prefs.getStringList('favoritePhrases');
    if (favoriteStrings != null) {
      _favoritePhrases = favoriteStrings
          .map((json) => Phrase.fromJson(jsonDecode(json)))
          .toList();
    }
    notifyListeners();
  }
}

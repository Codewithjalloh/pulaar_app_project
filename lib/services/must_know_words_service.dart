import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/word.dart';

class MustKnowWordsService {
  static Future<List<Word>> loadWords(String category) async {
    final String response =
        await rootBundle.loadString('assets/must_know_words.json');
    final Map<String, dynamic> data = await json.decode(response);
    final List<dynamic> wordsData = data[category];
    return wordsData.map((item) => Word.fromJson(item)).toList();
  }
}

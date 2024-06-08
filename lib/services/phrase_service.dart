import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/phrase.dart';

class PhraseService {
  Future<List<Phrase>> loadPhrases(String filename) async {
    final data = await rootBundle.loadString('assets/$filename');
    final jsonResult = json.decode(data) as List<dynamic>;
    return jsonResult.map((item) => Phrase.fromJson(item)).toList();
  }
}

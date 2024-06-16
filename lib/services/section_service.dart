import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/section.dart';
import '../model/phrase.dart';

class SectionService {
  static Future<List<Section>> loadSections() async {
    final String response = await rootBundle.loadString('assets/sections.json');
    final data = await json.decode(response) as List;
    return data.map((section) => Section.fromJson(section)).toList();
  }

  static Future<List<Phrase>> loadPhrases(String filename) async {
    final String response = await rootBundle.loadString(filename);
    final data = await json.decode(response) as List;
    return data.map((phrase) => Phrase.fromJson(phrase)).toList();
  }
}

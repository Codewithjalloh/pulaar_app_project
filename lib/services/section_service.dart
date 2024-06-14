import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/section.dart';
import '../model/phrase.dart';

class SectionService {
  Future<List<Section>> loadSections() async {
    final sections = <Section>[];
    final filenames = [
      'assets/1_greetings.json',
      'assets/2_introduction.json',
      'assets/3_family.json',
      'assets/4_places_things.json',
      'assets/5_food.json',
      'assets/6_body.json',
      'assets/7_shopping.json',
      'assets/8_travel_and_direction.json',
      'assets/9_daily_activities.json',
      'assets/10_ceremonies.json',
      'assets/11_fable.json',
      'assets/12_useful_advice.json',
      'assets/13_oral_history.json',
      'assets/14_stative_verbs.json',
      'assets/15_active_verbs.json',
    ];

    for (final filename in filenames) {
      final data = await rootBundle.loadString(filename);
      final jsonResult = json.decode(data);
      sections.add(Section.fromJson(jsonResult));
    }

    return sections;
  }
}

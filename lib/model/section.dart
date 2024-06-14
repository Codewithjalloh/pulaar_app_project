import 'package:flutter/material.dart';
import 'phrase.dart';

class Section {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Phrase> phrases;

  Section({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.phrases,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
      subtitle: json['subtitle'],
      icon: Icons.accessibility, // Add your logic for icon
      phrases:
          (json['phrases'] as List).map((p) => Phrase.fromJson(p)).toList(),
    );
  }
}

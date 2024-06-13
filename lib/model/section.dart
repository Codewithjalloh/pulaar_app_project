import 'package:flutter/material.dart';
import 'phrase.dart';

class Section {
  final String title;
  final String subtitle;
  final IconData icon;
  final String filename;
  final List<Phrase> phrases;

  Section({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.filename,
    required this.phrases,
  });
}

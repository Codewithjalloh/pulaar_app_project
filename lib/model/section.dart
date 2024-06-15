import 'package:flutter/material.dart';

class Section {
  final String title;
  final String subtitle;
  final IconData icon;
  final String filename;

  Section({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.filename,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      title: json['title'],
      subtitle: json['subtitle'],
      icon: Icons.accessibility, // Update this with appropriate logic for icons
      filename: json['filename'],
    );
  }
}

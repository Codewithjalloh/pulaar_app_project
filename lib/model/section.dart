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
      icon: IconData(int.parse(json['icon']), fontFamily: 'MaterialIcons'),
      filename: json['filename'],
    );
  }
}

final List<Section> sections = [
  Section(
    title: '1. Greetings',
    subtitle: 'On jaaraama',
    filename: 'assets/1_greetings.json',
    icon: Icons.pan_tool,
  ),
  Section(
    title: '2. Introductions',
    subtitle: 'Mido faalaa jommbude maa',
    filename: 'assets/2_introduction.json',
    icon: Icons.loop,
  ),
  Section(
    title: '3. Family',
    subtitle: 'Ko baaba an nii',
    filename: 'assets/3_family.json',
    icon: Icons.family_restroom,
  ),
  Section(
    title: '4. Places & Things',
    subtitle: 'Ko honno dun innetee e pular?',
    filename: 'assets/4_places_things.json',
    icon: Icons.place,
  ),
  Section(
    title: '5. Foods',
    subtitle: 'Beydu seeda',
    filename: 'assets/5_food.json',
    icon: Icons.food_bank,
  ),
  Section(
    title: '6. Body',
    subtitle: 'Himo mari hakkil',
    filename: 'assets/6_body.json',
    icon: Icons.accessibility,
  ),
  Section(
    title: '7. Shopping',
    subtitle: 'Mido mari pompiteeri',
    filename: 'assets/7_shopping.json',
    icon: Icons.shopping_cart,
  ),
  Section(
    title: '8. Travel & Directions',
    subtitle: 'Henndu no wadi',
    filename: 'assets/8_travel_and_direction.json',
    icon: Icons.explore,
  ),
  Section(
    title: '9. Daily Activities',
    subtitle: 'Huunde kala e saa’i mum',
    filename: 'assets/9_daily_activities.json',
    icon: Icons.notifications,
  ),
  Section(
    title: '10. Ceremonies',
    subtitle: 'Mi yahay nannde goo',
    filename: 'assets/10_ceremonies.json',
    icon: Icons.reduce_capacity,
  ),
  Section(
    title: '11. Fable',
    subtitle: 'Mi sikkuno ko samakala',
    filename: 'assets/11_fable.json',
    icon: Icons.psychology,
  ),
  Section(
    title: '12. Useful Advice',
    subtitle: 'haray himo janngude',
    filename: 'assets/12_useful_advice.json',
    icon: Icons.self_improvement,
  ),
  Section(
    title: '13. Oral History',
    subtitle: 'Fodde ko o hulbini',
    filename: 'assets/13_oral_history.json',
    icon: Icons.people,
  ),
  Section(
    title: '14. Stative Verbs',
    subtitle: 'Ko hommbo daaninoo?',
    filename: 'assets/14_stative_verbs.json',
    icon: Icons.close_fullscreen,
  ),
  Section(
    title: '15. Active Verbs',
    subtitle: 'Ko ka suudu o loototonoo',
    filename: 'assets/15_active_verbs.json',
    icon: Icons.compare_arrows,
  ),
];

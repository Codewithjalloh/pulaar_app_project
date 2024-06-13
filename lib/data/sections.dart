import 'package:flutter/material.dart';
import '../model/section.dart';
import '../model/phrase.dart';

final List<Section> sections = [
  Section(
    title: '1. Greetings',
    subtitle: 'On jaaraama',
    filename: '1_greetings.json',
    icon: Icons.pan_tool,
    phrases: [
      Phrase(english: 'Hello', pulaar: 'On jaaraama'),
      Phrase(english: 'Good morning', pulaar: 'Jam walii'),
    ],
  ),
  Section(
    title: '2. Introductions',
    subtitle: 'Mido faalaa jommbude maa',
    filename: '2_introduction.json',
    icon: Icons.loop,
    phrases: [
      Phrase(english: 'My name is', pulaar: 'Mido faalaa'),
      Phrase(english: 'What is your name?', pulaar: 'Hol no feewi?'),
    ],
  ),
  Section(
    title: '3. Family',
    subtitle: 'Ko baaba an nii',
    filename: '3_family.json',
    icon: Icons.family_restroom,
    phrases: [],
  ),
  Section(
    title: '4. Places & Things',
    subtitle: 'Ko honno dun innetee e pular?',
    filename: '4_places_things.json',
    icon: Icons.place,
    phrases: [],
  ),
  Section(
    title: '5. Foods',
    subtitle: 'Beydu seeda',
    filename: '5_food.json',
    icon: Icons.food_bank,
    phrases: [],
  ),
  Section(
    title: '6. Body',
    subtitle: 'Himo mari hakkil',
    filename: '6_body.json',
    icon: Icons.accessibility,
    phrases: [],
  ),
  Section(
    title: '7. Shopping',
    subtitle: 'Mido mari pompiteeri',
    filename: '7_shopping.json',
    icon: Icons.shopping_cart,
    phrases: [],
  ),
  Section(
    title: '8. Travel & Directions',
    subtitle: 'Henndu no wadi',
    filename: '8_travel_and_direction.json',
    icon: Icons.explore,
    phrases: [],
  ),
  Section(
    title: '9. Daily Activities',
    subtitle: 'Huunde kala e saa’i mum',
    filename: '9_daily_activities.json',
    icon: Icons.notifications,
    phrases: [],
  ),
  Section(
    title: '10. Ceremonies',
    subtitle: 'Mi yahay nannde goo',
    filename: '10_ceremonies.json',
    icon: Icons.reduce_capacity,
    phrases: [],
  ),
  Section(
    title: '11. Fable',
    subtitle: 'Mi sikkuno ko samakala',
    filename: '11_fable.json',
    icon: Icons.psychology,
    phrases: [],
  ),
  Section(
    title: '12. Useful Advice',
    subtitle: 'haray himo janngude',
    filename: '12_useful_advice.json',
    icon: Icons.self_improvement,
    phrases: [],
  ),
  Section(
    title: '13. Oral History',
    subtitle: 'Fodde ko o hulbini',
    filename: '13_oral_history.json',
    icon: Icons.people,
    phrases: [],
  ),
  Section(
    title: '14. Stative Verbs',
    subtitle: 'Ko hommbo daaninoo?',
    filename: '14_stative_verbs.json',
    icon: Icons.close_fullscreen,
    phrases: [],
  ),
  Section(
    title: '15. Active Verbs',
    subtitle: 'Ko ka suudu o loototonoo',
    filename: '15_active_verbs.json',
    icon: Icons.compare_arrows,
    phrases: [],
  ),
];

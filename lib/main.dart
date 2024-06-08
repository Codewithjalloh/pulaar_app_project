import 'package:flutter/material.dart';
import 'package:pulaar/pages/home_page.dart';
import 'package:pulaar/screens/fulani_history_screen.dart';
import 'package:pulaar/screens/information_screen.dart';
import 'package:pulaar/screens/quiz_section_screen.dart';
import 'package:pulaar/screens/currency_converter_screen.dart';
import 'package:pulaar/screens/african_countries_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulaar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/fulani_history': (context) => FulaniHistoryScreen(),
        '/information': (context) => InformationScreen(),
        '/quiz_section': (context) => QuizSectionScreen(),
        '/currency_converter': (context) => CurrencyConverterScreen(),
        '/african_countries': (context) => AfricanCountriesScreen(),
      },
    );
  }
}

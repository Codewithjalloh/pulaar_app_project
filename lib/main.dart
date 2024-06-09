import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pulaar/screens/home_page.dart';
import 'package:pulaar/screens/fulani_history_screen.dart';
import 'package:pulaar/screens/information_screen.dart';
import 'package:pulaar/screens/quiz_section_screen.dart';
import 'package:pulaar/screens/currency_converter_screen.dart';
import 'package:pulaar/screens/african_countries_screen.dart';
import 'package:pulaar/screens/must_know_words_screen.dart';
import 'package:pulaar/screens/login_screen.dart';
import 'package:pulaar/screens/profile_screen.dart';
import 'package:pulaar/screens/chat_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/must_know_words': (context) => MustKnowWordsScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}

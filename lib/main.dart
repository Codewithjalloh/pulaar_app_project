import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/favorite_phrases_provider.dart';
import 'services/my_auth_provider.dart'; // Updated import
import 'screens/home_page_screen.dart';
import 'screens/fulani_history_screen.dart';
import 'screens/information_screen.dart';
import 'screens/quiz_section_screen.dart';
import 'screens/currency_converter_screen.dart';
import 'screens/african_countries_screen.dart';
import 'screens/must_know_words_screen.dart';
import 'screens/login_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritePhrasesProvider()),
        ChangeNotifierProvider(
            create: (_) => MyAuthProvider()), // Updated class name
      ],
      child: MyApp(),
    ),
  );
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
        '/': (context) => HomePageScreen(),
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

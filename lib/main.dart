import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/favorite_phrases_provider.dart';
import 'services/my_auth_provider.dart';
import 'screens/home_page_screen.dart';
import 'screens/fulani_history_screen.dart';
import 'screens/information_screen.dart';
import 'screens/quiz_section_screen.dart';
import 'screens/currency_converter_screen.dart';
import 'screens/african_countries_screen.dart';
import 'screens/must_know_words_screen.dart';
import 'screens/login_screen.dart';
import 'screens/favorites_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritePhrasesProvider()),
        ChangeNotifierProvider(create: (_) => MyAuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}

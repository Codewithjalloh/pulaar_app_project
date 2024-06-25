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
  // Ensure Flutter bindings are initialized before using Firebase.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase.
  await Firebase.initializeApp();

  // Run the app with providers for state management.
  runApp(
    MultiProvider(
      providers: [
        // Provider for managing favorite phrases.
        ChangeNotifierProvider(create: (_) => FavoritePhrasesProvider()),

        // Provider for managing user authentication.
        ChangeNotifierProvider(create: (_) => MyAuthProvider()),
      ],
      child: const MyApp(), // Entry point of the app.
    ),
  );
}

// Main application widget.
class MyApp extends StatelessWidget {
  // Constructor with a key.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp to provide basic material design structure.
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner.
      title: 'Pulaar App', // Title of the app.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Theme color for the app.
      ),
      initialRoute: '/', // Initial route when the app starts.
      routes: {
        // Route for home screen.
        '/': (context) => HomePageScreen(),

        // Route for Fulani history screen.
        '/fulani_history': (context) => FulaniHistoryScreen(),

        // Route for information screen.
        '/information': (context) => InformationScreen(),

        // Route for quiz section screen.
        '/quiz_section': (context) => QuizSectionScreen(),

        // Route for currency converter screen.
        '/currency_converter': (context) => CurrencyConverterScreen(),

        // Route for African countries screen.
        '/african_countries': (context) => AfricanCountriesScreen(),

        // Route for must know words screen.
        '/must_know_words': (context) => MustKnowWordsScreen(),

        // Route for login screen.
        '/login': (context) => LoginScreen(),

        // Route for favorites screen.
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}

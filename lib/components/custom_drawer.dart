import 'package:flutter/material.dart';
import '../model/phrase.dart';
import '../screens/fulani_history_screen.dart';
import '../screens/information_screen.dart';
import '../screens/quiz_section_screen.dart';
import '../screens/currency_converter_screen.dart';
import '../screens/african_countries_screen.dart';
import '../screens/must_know_words_screen.dart';

class CustomDrawer extends StatelessWidget {
  final List<Phrase> favoritePhrases;

  CustomDrawer({super.key, required this.favoritePhrases});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;

          return ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Pulaar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isPortrait ? 40 : 30,
                    ),
                  ),
                ),
              ),
              _buildDrawerItem(
                context,
                icon: Icons.home,
                text: 'Home',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/');
                },
              ),
              _buildDrawerItem(
                context,
                icon: Icons.quiz,
                text: 'Quiz',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizSectionScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                icon: Icons.favorite,
                text: 'Favorites',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text('Favorites'),
                        ),
                        body: ListView.builder(
                          itemCount: favoritePhrases.length,
                          itemBuilder: (context, index) {
                            final phrase = favoritePhrases[index];
                            return ListTile(
                              title: Text(phrase.english),
                              subtitle: Text(phrase.pulaar),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                icon: Icons.history,
                text: 'Fulani History',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FulaniHistoryScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                icon: Icons.money,
                text: 'Currency Converter',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrencyConverterScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                icon: Icons.public,
                text: 'African Countries',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AfricanCountriesScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                icon: Icons.language,
                text: 'Must Know 100 Words',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MustKnowWordsScreen(),
                    ),
                  );
                },
              ),
              _buildDrawerItem(
                context,
                icon: Icons.info,
                text: 'Info',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationScreen(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}

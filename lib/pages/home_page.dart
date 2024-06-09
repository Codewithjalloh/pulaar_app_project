import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_drawer.dart';
import '../model/phrase.dart';
import '../model/section.dart';
import '../screens/category_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Phrase> favoritePhrases = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteStrings = prefs.getStringList('favoritePhrases');
    if (favoriteStrings != null) {
      setState(() {
        favoritePhrases = favoriteStrings
            .map((json) => Phrase.fromJson(jsonDecode(json)))
            .toList();
      });
    }
  }

  void _toggleFavorite(Phrase phrase) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (favoritePhrases.contains(phrase)) {
        favoritePhrases.remove(phrase);
      } else {
        favoritePhrases.add(phrase);
      }
      List<String> favoriteStrings =
          favoritePhrases.map((phrase) => jsonEncode(phrase.toJson())).toList();
      prefs.setStringList('favoritePhrases', favoriteStrings);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pulaar"),
      ),
      drawer: CustomDrawer(favoritePhrases: favoritePhrases),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        return Column(
          children: [
            ListTile(
              leading: Icon(section.icon, size: 50),
              title: Text(section.title, style: TextStyle(fontSize: 25)),
              subtitle: Text(section.subtitle, style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      title: section.title,
                      filename: section.filename,
                      toggleFavorite: (phrase) => context
                          .findAncestorStateOfType<_HomePageState>()
                          ?._toggleFavorite(phrase),
                      favoritePhrases: context
                              .findAncestorStateOfType<_HomePageState>()
                              ?.favoritePhrases ??
                          [],
                    ),
                  ),
                );
              },
            ),
            Divider(),
          ],
        );
      },
    );
  }
}

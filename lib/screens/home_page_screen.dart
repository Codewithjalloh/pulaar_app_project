import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_drawer.dart';
import '../services/favorite_phrases_provider.dart';
import '../data/sections.dart';
import '../model/section.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import 'phrase_detail_screen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    ChatPageWrapper(),
    ProfilePageWrapper(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pulaar"),
      ),
      drawer: CustomDrawer(),
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
    final favoritePhrasesProvider =
        Provider.of<FavoritePhrasesProvider>(context);

    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        return ExpansionTile(
          leading: Icon(section.icon, size: 40),
          title: Text(section.title, style: TextStyle(fontSize: 22)),
          subtitle: Text(section.subtitle, style: TextStyle(fontSize: 18)),
          children: section.phrases.map((phrase) {
            final isFavorite = favoritePhrasesProvider.isFavorite(phrase);
            return ListTile(
              title: Text(phrase.english),
              subtitle: Text(phrase.pulaar),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  favoritePhrasesProvider.toggleFavorite(phrase);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhraseDetailScreen(phrase: phrase),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}

class ChatPageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ChatScreen(),
    );
  }
}

class ProfilePageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ProfileScreen(),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_drawer.dart';
import '../model/phrase.dart';
import '../model/section.dart';
import '../screens/category_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pulaar"),
      ),
      drawer: CustomDrawer(favoritePhrases: favoritePhrases),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;
          final width = MediaQuery.of(context).size.width;

          return GridView.builder(
            padding: EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 2 : 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: width / (isPortrait ? 400 : 500),
            ),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        title: section.title,
                        filename: section.filename,
                        toggleFavorite: _toggleFavorite,
                        favoritePhrases: favoritePhrases,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(section.icon, size: 50, color: Colors.blueAccent),
                      SizedBox(height: 10),
                      Text(
                        section.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        section.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import '../model/section.dart';
import '../screens/phrase_detail_screen.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pulaar"),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return ListTile(
            leading: Icon(section.icon, size: 50),
            title: Text(section.title, style: TextStyle(fontSize: 25)),
            subtitle: Text(section.subtitle, style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhraseDetailScreen(
                    title: section.title,
                    filename: section.filename,
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

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        return ListTile(
          leading: Icon(section.icon, size: 50),
          title: Text(section.title, style: TextStyle(fontSize: 25)),
          subtitle: Text(section.subtitle, style: TextStyle(fontSize: 20)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhraseDetailScreen(
                  title: section.title,
                  filename: section.filename,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

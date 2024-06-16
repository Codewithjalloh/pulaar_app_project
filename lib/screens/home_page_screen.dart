import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import '../model/sections.dart'; // Ensure sections are loaded from the correct file
import 'category_screen.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(section.icon, size: 45), // Larger icon
              title: Text(
                section.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold), // Larger title text
              ),
              subtitle: Text(
                section.subtitle,
                style: TextStyle(fontSize: 20), // Larger subtitle text
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      title: section.title,
                      filename: section.filename,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

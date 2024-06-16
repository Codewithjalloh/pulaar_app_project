import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../components/custom_drawer.dart';
import 'category_screen.dart';
import '../model/section.dart';

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
      body: HomePageContent(),
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
                builder: (context) => CategoryScreen(
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

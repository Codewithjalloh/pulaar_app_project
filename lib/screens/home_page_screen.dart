import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/custom_drawer.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';
import 'category_screen.dart';
import '../model/section.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  static List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 1 || index == 2) {
      if (currentUser == null) {
        _showLoginPrompt(context);
        return;
      }
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showLoginPrompt(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Required'),
          content: Text('Please log in to access this feature.'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

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

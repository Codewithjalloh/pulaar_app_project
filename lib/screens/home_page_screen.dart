import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';

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
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Fulani History'),
          onTap: () {
            Navigator.pushNamed(context, '/fulani_history');
          },
        ),
        ListTile(
          leading: Icon(Icons.quiz),
          title: Text('Quiz Section'),
          onTap: () {
            Navigator.pushNamed(context, '/quiz_section');
          },
        ),
        ListTile(
          leading: Icon(Icons.money),
          title: Text('Currency Converter'),
          onTap: () {
            Navigator.pushNamed(context, '/currency_converter');
          },
        ),
        ListTile(
          leading: Icon(Icons.public),
          title: Text('African Countries'),
          onTap: () {
            Navigator.pushNamed(context, '/african_countries');
          },
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Must Know Words'),
          onTap: () {
            Navigator.pushNamed(context, '/must_know_words');
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('Information'),
          onTap: () {
            Navigator.pushNamed(context, '/information');
          },
        ),
      ],
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
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement edit profile functionality here
            },
          ),
        ],
      ),
      body: ProfileScreen(),
    );
  }
}

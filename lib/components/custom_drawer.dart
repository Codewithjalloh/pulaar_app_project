import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
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
                  fontSize: 40,
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
            icon: Icons.history,
            text: 'Fulani History',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/fulani_history');
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.quiz,
            text: 'Quiz Section',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/quiz_section');
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.money,
            text: 'Currency Converter',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/currency_converter');
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.public,
            text: 'African Countries',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/african_countries');
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.language,
            text: 'Must Know Words',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/must_know_words');
            },
          ),
          if (user != null)
            _buildDrawerItem(
              context,
              icon: Icons.chat,
              text: 'Chat',
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
            ),
          if (user != null)
            _buildDrawerItem(
              context,
              icon: Icons.person,
              text: 'Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
          if (user == null)
            _buildDrawerItem(
              context,
              icon: Icons.login,
              text: 'Login',
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          if (user != null)
            _buildDrawerItem(
              context,
              icon: Icons.logout,
              text: 'Logout',
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
        ],
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

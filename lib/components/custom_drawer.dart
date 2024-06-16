import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/my_auth_provider.dart';
import '../screens/favorites_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider>(context);
    final user = authProvider.user;

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
            icon: Icons.favorite,
            text: 'Favorites',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.info,
            text: 'Information',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/information');
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
          // Add other drawer items here if needed
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

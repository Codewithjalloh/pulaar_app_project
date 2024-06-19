import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer header
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'Pulaar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
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
            icon: Icons.favorite,
            text: 'Favorites',
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(),
                ),
              );
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
            icon: Icons.language,
            text: 'Must Know Words',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/must_know_words');
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
          // african country drawer
          _buildDrawerItem(
            context,
            icon: Icons.public,
            text: 'African Countries',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/african_countries');
            },
          ),
          Divider(thickness: 1, color: Colors.grey[400]),
          // fulani history drawer
          _buildDrawerItem(
            context,
            icon: Icons.history,
            text: 'Fulani History',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/fulani_history');
            },
          ),
          // information item drawer
          _buildDrawerItem(
            context,
            icon: Icons.info,
            text: 'Information',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/information');
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey[600]),
            ),
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
      leading: Icon(icon, size: 30, color: Colors.blueAccent),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}

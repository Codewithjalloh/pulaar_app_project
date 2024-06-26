import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: const Text(
            'Information',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildSectionTitle('About This App'),
              const SizedBox(height: 10),
              _buildSectionText(
                  'This app is designed to help users learn and understand the Pulaar language. '
                  'Pulaar, also known as Fula, is spoken by the Fula people across West Africa.'),
              const SizedBox(height: 20),
              _buildSectionTitle('How to Use'),
              const SizedBox(height: 10),
              _buildSectionText(
                  'Navigate through the different categories to find common phrases and their English translations. '
                  'Tap on any phrase to see more details.'),
              const SizedBox(height: 20),
              _buildSectionTitle('Credits'),
              const SizedBox(height: 10),
              _buildSectionText(
                  'This app was developed by techrisemedia. Special thanks to all contributors who provided the data and resources.'),
              const SizedBox(height: 20),
              _buildSectionTitle('Contact Us'),
              const SizedBox(height: 10),
              _buildSectionText(
                  'For any questions or feedback, please contact us at codewithjalloh@gmail.com.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        height: 1.5,
        color: Colors.black87,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

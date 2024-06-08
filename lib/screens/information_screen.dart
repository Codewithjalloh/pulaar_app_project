import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      drawer: CustomDrawer(
        favoritePhrases: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;

            return ListView(
              children: [
                _buildSectionTitle('About This App', isPortrait),
                _buildSectionText(
                  'This app is designed to help users learn and understand the Pulaar language. '
                  'Pulaar, also known as Fula, is spoken by the Fula people across West Africa.',
                  isPortrait,
                ),
                SizedBox(height: 20),
                _buildSectionTitle('How to Use', isPortrait),
                _buildSectionText(
                  'Navigate through the different categories to find common phrases and their English translations. '
                  'Tap on any phrase to see more details.',
                  isPortrait,
                ),
                SizedBox(height: 20),
                _buildSectionTitle('Credits', isPortrait),
                _buildSectionText(
                  'This app was developed by techrisemedia. Special thanks to all contributors who provided the data and resources.',
                  isPortrait,
                ),
                SizedBox(height: 20),
                _buildSectionTitle('Contact Us', isPortrait),
                _buildSectionText(
                  'For any questions or feedback, please contact us at codewithjalloh@gmail.com.',
                  isPortrait,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isPortrait) {
    return Text(
      title,
      style: TextStyle(
        fontSize: isPortrait ? 24 : 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSectionText(String text, bool isPortrait) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isPortrait ? 18 : 16,
        height: 1.5,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

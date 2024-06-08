import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/phrase_icon_mapping.dart';
import '../model/phrase.dart';

class PhraseDetailScreen extends StatelessWidget {
  final Phrase phrase;

  PhraseDetailScreen({required this.phrase});

  @override
  Widget build(BuildContext context) {
    IconData? iconData = phraseIconMapping[phrase.english.toLowerCase()];

    return Scaffold(
      appBar: AppBar(
        title: Text('Phrase Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  if (iconData != null)
                    Center(
                      child: FaIcon(
                        iconData,
                        size: isPortrait ? 100 : 80,
                        color: Colors.blueAccent,
                      ),
                    ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Phrase Details',
                      style: TextStyle(
                        fontSize: isPortrait ? 28 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  _buildPhraseCard(
                    context,
                    title: 'English:',
                    phrase: phrase.english,
                    isPortrait: isPortrait,
                    backgroundColor: Colors.blue[50]!,
                  ),
                  SizedBox(height: 20),
                  _buildPhraseCard(
                    context,
                    title: 'Pulaar:',
                    phrase: phrase.pulaar,
                    isPortrait: isPortrait,
                    backgroundColor: Colors.green[50]!,
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      label: Text('Go Back'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: TextStyle(
                          fontSize: isPortrait ? 18 : 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPhraseCard(
    BuildContext context, {
    required String title,
    required String phrase,
    required bool isPortrait,
    required Color backgroundColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isPortrait ? 20 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            phrase,
            style: TextStyle(
              fontSize: isPortrait ? 24 : 22,
            ),
          ),
        ],
      ),
    );
  }
}

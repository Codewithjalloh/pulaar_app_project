import 'package:flutter/material.dart';
import '../services/must_know_words.dart';
import '../model/word.dart';

class MustKnowWordsScreen extends StatefulWidget {
  @override
  _MustKnowWordsScreenState createState() => _MustKnowWordsScreenState();
}

class _MustKnowWordsScreenState extends State<MustKnowWordsScreen> {
  List<Word> words = [];
  List<Word> filteredWords = [];
  TextEditingController searchController = TextEditingController();
  String selectedCategory = 'basic_words';

  final categories = {
    'Basic Words': 'basic_words',
    'Numbers': 'numbers',
    'Date & Time': 'date_time',
    'Seasons': 'seasons',
    'Polite Words': 'polite_words',
  };

  @override
  void initState() {
    super.initState();
    _loadWords();
    searchController.addListener(_filterWords);
  }

  Future<void> _loadWords() async {
    words = await MustKnowWordsService.loadWords(selectedCategory);
    setState(() {
      filteredWords = words;
    });
  }

  void _filterWords() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredWords = words
          .where((word) =>
              word.english.toLowerCase().contains(query) ||
              word.french.toLowerCase().contains(query) ||
              word.chinese.toLowerCase().contains(query) ||
              word.dutch.toLowerCase().contains(query) ||
              word.russian.toLowerCase().contains(query) ||
              word.arabic.toLowerCase().contains(query))
          .toList();
    });
  }

  void _changeCategory(String category) {
    setState(() {
      selectedCategory = categories[category]!;
      _loadWords();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: Text(
            'Must Know 100 Words',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.keys.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () => _changeCategory(category),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == categories[category]
                          ? Colors.blueAccent
                          : Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == categories[category]
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWords.length,
              itemBuilder: (context, index) {
                final word = filteredWords[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildWordRow('English', word.english, '', context),
                          _buildWordRow('French', word.french,
                              word.frenchPronunciation, context),
                          _buildWordRow('Chinese', word.chinese,
                              word.chinesePronunciation, context),
                          _buildWordRow('Dutch', word.dutch,
                              word.dutchPronunciation, context),
                          _buildWordRow('Russian', word.russian,
                              word.russianPronunciation, context),
                          _buildWordRow('Arabic', word.arabic,
                              word.arabicPronunciation, context),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordRow(String language, String translation,
      String pronunciation, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '$language: ',
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          Expanded(
            child: Text(
              translation,
              style: textTheme.bodyLarge?.copyWith(fontSize: 16),
            ),
          ),
          if (pronunciation.isNotEmpty)
            Text(
              '($pronunciation)',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
        ],
      ),
    );
  }
}

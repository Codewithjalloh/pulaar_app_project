class Word {
  // Define the properties for the class
  final String english; // English word
  final String french; // French translation
  final String frenchPronunciation; // French pronunciation
  final String chinese; // Chinese translation
  final String chinesePronunciation; // Chinese pronunciation
  final String dutch; // Dutch translation
  final String dutchPronunciation; // Dutch pronunciation
  final String russian; // Russian translation
  final String russianPronunciation; // Russian pronunciation
  final String arabic; // Arabic translation
  final String arabicPronunciation; // Arabic pronunciation

  // Constructor for initializing the properties
  Word({
    required this.english,
    required this.french,
    required this.frenchPronunciation,
    required this.chinese,
    required this.chinesePronunciation,
    required this.dutch,
    required this.dutchPronunciation,
    required this.russian,
    required this.russianPronunciation,
    required this.arabic,
    required this.arabicPronunciation,
  });

  // Factory constructor for creating a new Word instance from a JSON map
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      english: json['english'], // Extract the English word from the JSON map
      french:
          json['french'], // Extract the French translation from the JSON map
      frenchPronunciation: json[
          'french_pronunciation'], // Extract the French pronunciation from the JSON map
      chinese:
          json['chinese'], // Extract the Chinese translation from the JSON map
      chinesePronunciation: json[
          'chinese_pronunciation'], // Extract the Chinese pronunciation from the JSON map
      dutch: json['dutch'], // Extract the Dutch translation from the JSON map
      dutchPronunciation: json[
          'dutch_pronunciation'], // Extract the Dutch pronunciation from the JSON map
      russian:
          json['russian'], // Extract the Russian translation from the JSON map
      russianPronunciation: json[
          'russian_pronunciation'], // Extract the Russian pronunciation from the JSON map
      arabic:
          json['arabic'], // Extract the Arabic translation from the JSON map
      arabicPronunciation: json[
          'arabic_pronunciation'], // Extract the Arabic pronunciation from the JSON map
    );
  }

  // Method to convert a Word instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'english': english, // Add the English word to the JSON map
      'french': french, // Add the French translation to the JSON map
      'french_pronunciation':
          frenchPronunciation, // Add the French pronunciation to the JSON map
      'chinese': chinese, // Add the Chinese translation to the JSON map
      'chinese_pronunciation':
          chinesePronunciation, // Add the Chinese pronunciation to the JSON map
      'dutch': dutch, // Add the Dutch translation to the JSON map
      'dutch_pronunciation':
          dutchPronunciation, // Add the Dutch pronunciation to the JSON map
      'russian': russian, // Add the Russian translation to the JSON map
      'russian_pronunciation':
          russianPronunciation, // Add the Russian pronunciation to the JSON map
      'arabic': arabic, // Add the Arabic translation to the JSON map
      'arabic_pronunciation':
          arabicPronunciation, // Add the Arabic pronunciation to the JSON map
    };
  }
}

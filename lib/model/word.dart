class Word {
  final String english;
  final String french;
  final String frenchPronunciation;
  final String chinese;
  final String chinesePronunciation;
  final String dutch;
  final String dutchPronunciation;
  final String russian;
  final String russianPronunciation;
  final String arabic;
  final String arabicPronunciation;

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

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      english: json['english'],
      french: json['french'],
      frenchPronunciation: json['french_pronunciation'],
      chinese: json['chinese'],
      chinesePronunciation: json['chinese_pronunciation'],
      dutch: json['dutch'],
      dutchPronunciation: json['dutch_pronunciation'],
      russian: json['russian'],
      russianPronunciation: json['russian_pronunciation'],
      arabic: json['arabic'],
      arabicPronunciation: json['arabic_pronunciation'],
    );
  }
}

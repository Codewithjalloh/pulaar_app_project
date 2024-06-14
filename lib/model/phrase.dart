class Phrase {
  final String english;
  final String pulaar;

  Phrase({
    required this.english,
    required this.pulaar,
  });

  factory Phrase.fromJson(Map<String, dynamic> json) {
    return Phrase(
      english: json['english'],
      pulaar: json['pulaar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'english': english,
      'pulaar': pulaar,
    };
  }
}

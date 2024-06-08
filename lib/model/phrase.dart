class Phrase {
  final String english;
  final String pulaar;

  Phrase({required this.english, required this.pulaar});

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Phrase &&
          runtimeType == other.runtimeType &&
          english == other.english &&
          pulaar == other.pulaar;

  @override
  int get hashCode => english.hashCode ^ pulaar.hashCode;
}

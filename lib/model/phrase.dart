class Phrase {
  // Define the properties for the class
  final String english; // The English version of the phrase
  final String pulaar; // The Pulaar version of the phrase

  // Constructor for initializing the properties
  Phrase({required this.english, required this.pulaar});

  // Factory constructor for creating a new Phrase instance from a JSON map
  factory Phrase.fromJson(Map<String, dynamic> json) {
    return Phrase(
      english: json['english'], // Extract the English phrase from the JSON map
      pulaar: json['pulaar'], // Extract the Pulaar phrase from the JSON map
    );
  }

  // Method for converting a Phrase instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'english': english, // Add the English phrase to the JSON map
      'pulaar': pulaar, // Add the Pulaar phrase to the JSON map
    };
  }
}

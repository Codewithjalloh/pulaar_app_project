import 'package:http/http.dart' as http;
import 'dart:convert';

class Country {
  final String name;
  final String capital;
  final String population;
  final String area;
  final String currency;
  final String language;
  final String flag;
  final String region;
  final String subregion;
  final List<String> borders;
  final String nativeName;

  Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.area,
    required this.currency,
    required this.language,
    required this.flag,
    required this.region,
    required this.subregion,
    required this.borders,
    required this.nativeName,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      capital:
          (json['capital'] as List).isNotEmpty ? json['capital'][0] : 'N/A',
      population: json['population'].toString(),
      area: json['area'].toString(),
      currency: json['currencies'] != null
          ? (json['currencies'] as Map<String, dynamic>).keys.first
          : 'N/A',
      language: json['languages'] != null
          ? (json['languages'] as Map<String, dynamic>).values.first
          : 'N/A',
      flag: json['flags']['png'],
      region: json['region'],
      subregion: json['subregion'],
      borders: List<String>.from(json['borders'] ?? []),
      nativeName: json['name']['nativeName'] != null
          ? json['name']['nativeName'].values.first['common']
          : 'N/A',
    );
  }
}

class CountryService {
  static const String _baseUrl = 'https://restcountries.com/v3.1/region/africa';

  Future<List<Country>> fetchAfricanCountries() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}

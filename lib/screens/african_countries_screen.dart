import 'package:flutter/material.dart';
import '../services/country_service.dart';
import 'country_detail_screen.dart';

class AfricanCountriesScreen extends StatefulWidget {
  @override
  _AfricanCountriesScreenState createState() => _AfricanCountriesScreenState();
}

class _AfricanCountriesScreenState extends State<AfricanCountriesScreen> {
  final CountryService _countryService = CountryService();
  late Future<List<Country>> _countriesFuture;

  @override
  void initState() {
    super.initState();
    _countriesFuture = _countryService.fetchAfricanCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('African Countries'),
      ),
      body: FutureBuilder<List<Country>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No countries found'));
          } else {
            final countries = snapshot.data!;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return ListTile(
                  title: Text(country.name),
                  subtitle: Text('Capital: ${country.capital}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryDetailScreen(country: country),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

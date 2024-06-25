import 'package:flutter/material.dart';
import '../services/country_service.dart';
import 'country_detail_screen.dart';

class AfricanCountriesScreen extends StatefulWidget {
  const AfricanCountriesScreen({Key? key}) : super(key: key);

  @override
  _AfricanCountriesScreenState createState() => _AfricanCountriesScreenState();
}

class _AfricanCountriesScreenState extends State<AfricanCountriesScreen> {
  final CountryService _countryService = CountryService();
  late Future<List<Country>> _countriesFuture;

  @override
  void initState() {
    super.initState();
    // Fetch the list of African countries when the widget is initialized.
    _countriesFuture = _countryService.fetchAfricanCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with gradient background and title
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: const Text(
            'African Countries',
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
      // Use FutureBuilder to build the UI based on the state of _countriesFuture
      body: FutureBuilder<List<Country>>(
        future: _countriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading spinner while waiting for data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message if an error occurs
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Show message if no data is found
            return const Center(child: Text('No countries found'));
          } else {
            final countries = snapshot.data!;
            // Build a list of countries
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        // Navigate to CountryDetailScreen when a country is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CountryDetailScreen(country: country),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Display country flag
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                country.flag,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.flag, size: 50);
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Display country name
                                  Text(
                                    country.name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  // Display country capital
                                  Text(
                                    'Capital: ${country.capital}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Forward icon
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Country {
  final String name;
  final String code;

  Country({required this.name, required this.code});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
    );
  }
}

class CountryUtil {
  static List<Country> _countries = [];

  /// Load country data from JSON and cache it
  static Future<List<Country>> loadCountries() async {
    if (_countries.isEmpty) {
      final String response =
          await rootBundle.loadString('assets/countries.json');
      final List<dynamic> data = jsonDecode(response);
      _countries = data.map((item) => Country.fromJson(item)).toList();
    }
    return _countries;
  }

  /// Filter countries by search query
  static Future<List<Country>> searchCountries(String query) async {
    final List<Country> countries = await loadCountries();
    if (query.isEmpty) return countries;
    return countries
        .where((country) =>
            country.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

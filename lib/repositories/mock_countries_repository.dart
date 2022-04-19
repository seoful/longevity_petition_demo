import 'package:in_time_petition_demo/model/country.dart';
import 'package:in_time_petition_demo/repositories/interfaces/country_repository.dart';

class MockCountryRepository implements CountryRepository {
  @override
  Future<List<Country>> loadCountries() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Country("https://chng.it/7WZbBvGzpk", "USA"),
      Country("https://chng.it/7WZbBvGzpk", "Bolivia"),
      Country("https://chng.it/7WZbBvGzpk", "Russia"),
      Country("https://chng.it/7WZbBvGzpk", "Australia"),
      Country("https://chng.it/7WZbBvGzpk", "Bangladesh"),
      Country("https://chng.it/7WZbBvGzpk", "Brazil"),
      Country("https://chng.it/7WZbBvGzpk", "Chile"),
      Country("https://chng.it/7WZbBvGzpk", "Canada"),
      Country("https://chng.it/7WZbBvGzpk", "Cuba"),
      Country("https://chng.it/7WZbBvGzpk", "Israel"),
      Country("https://chng.it/7WZbBvGzpk", "Turkey"),
      Country("https://chng.it/7WZbBvGzpk", "Angola"),
      Country("https://chng.it/7WZbBvGzpk", "Alger"),
      Country("https://chng.it/7WZbBvGzpk", "Ecuador"),
      Country("https://chng.it/7WZbBvGzpk", "Finland"),
      Country("https://chng.it/7WZbBvGzpk", "France"),
      Country("https://chng.it/7WZbBvGzpk", "Germany"),
      Country("https://chng.it/7WZbBvGzpk", "Ireland"),
      Country("https://chng.it/7WZbBvGzpk", "Spain"),
      Country("https://chng.it/7WZbBvGzpk", "Ukraine"),
      Country("https://chng.it/7WZbBvGzpk", "united Kingdom"),
      Country("https://chng.it/7WZbBvGzpk", "Greece"),
    ];
  }
}

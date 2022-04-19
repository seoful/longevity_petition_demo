import 'package:in_time_petition_demo/model/country.dart';

abstract class CountryRepository {
  Future<List<Country>> loadCountries();
}

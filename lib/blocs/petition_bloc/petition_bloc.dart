import 'package:bloc/bloc.dart';
import 'package:in_time_petition_demo/repositories/interfaces/country_repository.dart';
import 'package:in_time_petition_demo/repositories/mock_countries_repository.dart';
import 'package:meta/meta.dart';

import '../../model/country.dart';

part 'petition_event.dart';
part 'petition_state.dart';

class PetitionBloc extends Bloc<PetitionEvent, PetitionState> {
  final CountryRepository _countryRepository = MockCountryRepository();

  late List<Country> _countries;

  PetitionBloc() : super(PetitionInitial()) {
    on<LoadPetitionCountries>((event, emit) async {
      emit(CountriesLoading());
      _countries = await _countryRepository.loadCountries();
      emit(CountriesListUpdated(_countries));
    });

    on<FindCountriesByQuery>((event, emit) {
      final _countriesSubList = _countries
          .where((element) =>
              element.name.toLowerCase().startsWith(event.query.toLowerCase()))
          .toList();
      emit(CountriesListUpdated(_countriesSubList));
    });

    add(LoadPetitionCountries());
  }
}

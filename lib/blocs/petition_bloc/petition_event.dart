part of 'petition_bloc.dart';

@immutable
abstract class PetitionEvent {}

class LoadPetitionCountries extends PetitionEvent {}

class FindCountriesByQuery extends PetitionEvent {
  final String query;

  FindCountriesByQuery(this.query);
}

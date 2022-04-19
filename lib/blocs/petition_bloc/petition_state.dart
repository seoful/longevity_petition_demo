part of 'petition_bloc.dart';

@immutable
abstract class PetitionState {}

class PetitionInitial extends PetitionState {}

class CountriesLoading extends PetitionState {}

class CountriesListUpdated extends PetitionState {
  final List<Country> countries;

  CountriesListUpdated(this.countries);
}

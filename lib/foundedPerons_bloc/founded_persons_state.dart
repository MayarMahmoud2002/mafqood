part of 'founded_persons_bloc.dart';

@immutable
abstract class FoundedPersonsState {}

class FoundedPersonsInitial extends FoundedPersonsState {}
class FoundedPersonsLoadingState extends FoundedPersonsState {}
class FoundedPersonsSuccessState extends FoundedPersonsState
{
  final List <Map <String , dynamic>> foundedPersons;

  FoundedPersonsSuccessState(this.foundedPersons);
}
class FoundedPersonsUpdateSuccessState extends FoundedPersonsState {}
class FoundedPersonsErrorState extends FoundedPersonsState
{
  final String error;

  FoundedPersonsErrorState({required this.error} );
}


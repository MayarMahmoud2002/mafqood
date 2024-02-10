part of 'lost_person_bloc.dart';

@immutable
abstract class LostPersonState {}

class LostPersonInitial extends LostPersonState {}
class LostPostLoadingState extends LostPersonState{}
class LostPostSuccessState extends LostPersonState{}
class LostPostErrorState extends LostPersonState{
  final String error;

  LostPostErrorState({required this.error});
}


part of 'find_post_bloc.dart';

@immutable
abstract class FindPostState {}

class FindPostInitial extends FindPostState {}
class FindPostLoadingState extends FindPostState{}
class FindPostSuccessState extends FindPostState {}
class FindPostErrorState extends FindPostState
{
  final String error;

  FindPostErrorState({required this.error});
}
class FindPostGenderSelectedState extends FindPostState
{
  final String selectedGender;
  FindPostGenderSelectedState(this.selectedGender);
}

part of 'persons_bloc.dart';

@immutable
abstract class PersonsState {}

class PersonsInitial extends PersonsState {}
class GetFoundedPersonsLoading extends PersonsState {}
class GetFoundedPersonsSuccess extends PersonsState {
  final List<PostModel> posts;
  GetFoundedPersonsEvent event;
  GetFoundedPersonsSuccess({required this.posts,required this.event});
}
class GetFoundedPersonsFailure extends PersonsState {
  final String error;
  GetFoundedPersonsFailure({required this.error});
}
class DeleteFoundedOrMissingPersonLoading extends PersonsState {}
class DeleteFoundedPersonSuccess extends PersonsState {}
class DeleteFoundedPersonFailure extends PersonsState {
  final String error;
  DeleteFoundedPersonFailure({required this.error});
}
class AddFoundedOrMissingPersonLoading extends PersonsState {}
class AddFoundedOrMissingPersonSuccess extends PersonsState {}
class AddFoundedOrMissingPersonFailure extends PersonsState {
  final String error;
  AddFoundedOrMissingPersonFailure({required this.error});
}

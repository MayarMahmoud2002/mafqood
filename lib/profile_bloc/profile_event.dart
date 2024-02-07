part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class FetchProfileEvent extends ProfileEvent{}
class UpdateProfileEvent extends ProfileEvent {
  final Map<String , dynamic> updatedData;

  UpdateProfileEvent(this.updatedData);
}
class DeleteProfileEvent extends ProfileEvent{}

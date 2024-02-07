part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState{}
class ProfileLoadedState extends ProfileState {
  final Map <String , dynamic> profileData;

  ProfileLoadedState(this.profileData);
}
class ProfileDeletedState extends ProfileState{}
class ProfileErrorState extends ProfileState{
  final String error;

  ProfileErrorState({required this.error});
}


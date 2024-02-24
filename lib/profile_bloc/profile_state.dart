part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileDataLoading extends ProfileState {
}
class GetProfileDataSuccess extends ProfileState {
  User user;
  GetProfileDataSuccess({required this.user});
}
class GetProfileDataFailure extends ProfileState {
  final String error;
  GetProfileDataFailure({required this.error});
}
class DeleteProfileLoading extends ProfileState {}
class DeleteProfileSuccess extends ProfileState {}
class DeleteProfileFailure extends ProfileState {
  final String error;
  DeleteProfileFailure({required this.error});
}
class UpdateProfileLoading extends ProfileState {}
class UpdateProfileSuccess extends ProfileState {}
class UpdateProfileFailure extends ProfileState {
  final String error;
  UpdateProfileFailure({required this.error});
}

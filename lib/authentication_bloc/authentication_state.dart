part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationLoading extends AuthenticationState {
}
class AuthenticationSuccess extends AuthenticationState
{
  final String token;

  AuthenticationSuccess({required this.token});
}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure({required this.error});
}

//*****************************************************************************
// abstract class ProfileState{}
// class ProfileLoading extends ProfileState{}
// class ProfileLoaded extends ProfileState {
//   final Map <String , dynamic> profileData;
//
//   ProfileLoaded(this.profileData);
// }
// class ProfileDeleted extends ProfileState{}
// class ProfileError extends ProfileState{
//   final String error;
//
//   ProfileError({required this.error});
// }




part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class RegisterNamePasswordLoading extends AuthenticationState {}
class RegisterNamePasswordSuccess extends AuthenticationState {}
class RegisterNamePasswordFailure extends AuthenticationState {
  final String error;
  RegisterNamePasswordFailure({required this.error});
}
class RegisterLocationLoading extends AuthenticationState {}
class RegisterLocationSuccess extends AuthenticationState {}
class RegisterLocationFailure extends AuthenticationState {
  final String error;
  RegisterLocationFailure({required this.error});
}
class RegisterGenderAndImageProfileLoading extends AuthenticationState {}
class RegisterGenderAndImageProfileSuccess extends AuthenticationState {}
class RegisterGenderAndImageProfileFailure extends AuthenticationState {
  final String error;
  RegisterGenderAndImageProfileFailure({required this.error});
}
class RegisterIdImagesLoading extends AuthenticationState {}
class RegisterIdImagesSuccess extends AuthenticationState {}
class RegisterIdImagesFailure extends AuthenticationState {
  final String error;
  RegisterIdImagesFailure({required this.error});
}

class SendRegisterRequestLoading extends AuthenticationState {}
class SendRegisterRequestSuccess extends AuthenticationState {}
class SendRegisterRequestFailure extends AuthenticationState {
  final String error;
  SendRegisterRequestFailure({required this.error});
}

class GenerateOTPLoading extends AuthenticationState {}
class GenerateOTPSuccess extends AuthenticationState {}
class GenerateOTPFailure extends AuthenticationState {
  final String error;
  GenerateOTPFailure({required this.error});
}
class VerifyOTPLoading extends AuthenticationState {}
class VerifyOTPSuccess extends AuthenticationState {}
class VerifyOTPFailure extends AuthenticationState {
  final String error;
  VerifyOTPFailure({required this.error});
}



class RegisterResetPasswordLoading extends AuthenticationState {}
class RegisterResetPasswordSuccess extends AuthenticationState {}
class RegisterResetPasswordFailure extends AuthenticationState {
  final String error;
  RegisterResetPasswordFailure({required this.error});
}
class SignInLoading extends AuthenticationState {}
class SignInSuccess extends AuthenticationState {
  final String token;
  SignInSuccess({required this.token});
}
class SignInFailure extends AuthenticationState {
  final String error;
  SignInFailure({required this.error});
}

class UpdatePasswordLoading extends AuthenticationState {}
class UpdatePasswordSuccess extends AuthenticationState {}
class UpdatePasswordFailure extends AuthenticationState {
  final String error;
  UpdatePasswordFailure({required this.error});
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




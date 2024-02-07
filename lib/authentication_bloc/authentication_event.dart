part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent
{
  final String phone;
  final String password;

  SignInEvent({required this.phone,required this.password});
}
class RegisterNamePasswordEvent extends AuthenticationEvent
{
  final String name;
  final String password;

  RegisterNamePasswordEvent({required this.name, required this.password,});
}
class RegisterResetPasswordEvent extends AuthenticationEvent
{
  final String password;

  RegisterResetPasswordEvent({required this.password,});
}
class RegisterLocationEvent extends AuthenticationEvent
{
  final String country;
  final String state;
  final String city;

  RegisterLocationEvent({required this.country, required this.state, required this.city});
}
class RegisterGenderAndImageProfileEvent extends AuthenticationEvent
{
  final String gender;
  final String imageProfile;

  RegisterGenderAndImageProfileEvent({required this.imageProfile, required this.gender});
}
class RegisterIdImagesEvent extends AuthenticationEvent
{
  final String nationalIdFrontImage;
  final String nationalIdBackImage;

  RegisterIdImagesEvent({required this.nationalIdFrontImage, required this.nationalIdBackImage});
}
class GenerateOTPEvent  extends AuthenticationEvent
{
  final String phone;

  GenerateOTPEvent({required this.phone});
}
class CheckOTPEvent   extends AuthenticationEvent
{
  final String otp;

  CheckOTPEvent({required this.otp});
}
class SelectPhotoEvent    extends AuthenticationEvent
{
  final ImageSource source;

  SelectPhotoEvent({required this.source});
}
//************************************************************************
abstract class ProfileEvent {}
class FetchProfileEvent extends ProfileEvent{}
class UpdateProfileEvent extends ProfileEvent {
  final Map<String , dynamic> updatedData;

  UpdateProfileEvent(this.updatedData);
}
class DeleteProfileEvent extends ProfileEvent{}







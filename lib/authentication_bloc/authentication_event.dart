part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent
{
  final String phone;
  final String password;

  SignInEvent({required this.phone,required this.password});
}



import 'package:flutter/material.dart';
import 'package:mafqood/users_bloc/user_data/user_data.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}
class UsersLoadingState extends UsersState {}
class UsersSuccessState extends UsersState {
  final List<UserData> usersData;

  UsersSuccessState(this.usersData);
}

class UsersErrorState extends UsersState {
  final String error;

  UsersErrorState({required this.error});
}
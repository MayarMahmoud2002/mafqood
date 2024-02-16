

import 'package:flutter/material.dart';

@immutable
abstract class LostPersonsState {}

class LostPersonsInitial extends LostPersonsState {}
class LostPersonsLoadingState extends LostPersonsState {}
class LostPersonsSuccessState extends LostPersonsState
{
  final List <Map <String , dynamic>> lostPersons;

  LostPersonsSuccessState(this.lostPersons);
}
class LostPersonsUpdateSuccessState extends LostPersonsState {}
class LostPersonsErrorState extends LostPersonsState
{
  final String error;

  LostPersonsErrorState({required this.error});
}


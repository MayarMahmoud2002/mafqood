
import 'package:flutter/material.dart';

@immutable
abstract class LostPersonsEvent {}
class LoadLostPersonsEvent extends LostPersonsEvent{}
class UpdateLostPersonEvent extends LostPersonsEvent{
  final int personId;
  final Map <String , dynamic > updatedData;

  UpdateLostPersonEvent(this.personId, this.updatedData);
}

class DeleteLostPersonEvent extends LostPersonsEvent
{
  final int personId;

  DeleteLostPersonEvent(this.personId);
}


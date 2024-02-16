part of 'lost_person_bloc.dart';

@immutable
abstract class LostPersonEvent {}
class SubmitLostFormEvent extends LostPersonEvent
{
  final Map <String , dynamic> fromData;

  SubmitLostFormEvent({required this.fromData});
}

class UpdateLostFormEvent extends LostPersonEvent {
  final Map<String, dynamic> updatedData;
  final int personId;

  UpdateLostFormEvent({required this.personId, required this.updatedData });
}
part of 'lost_person_bloc.dart';

@immutable
abstract class LostPersonEvent {}
class SubmitLostFormEvent extends LostPersonEvent
{
  final Map <String , dynamic> fromData;

  SubmitLostFormEvent({required this.fromData});
}

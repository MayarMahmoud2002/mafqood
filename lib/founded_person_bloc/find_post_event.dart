part of 'find_post_bloc.dart';

@immutable
abstract class FindPostEvent {
}
class SubmitFormEvent extends  FindPostEvent
{
  final Map <String , dynamic> fromData;

  SubmitFormEvent({required this.fromData});

}
class SelectGenderEvent extends FindPostEvent {
  final String gender;

  SelectGenderEvent(this.gender);
}
class UpdateFormEvent extends FindPostEvent {
  final Map<String, dynamic> updatedData;
  final int personId;

  UpdateFormEvent({required this.personId, required this.updatedData, });
}

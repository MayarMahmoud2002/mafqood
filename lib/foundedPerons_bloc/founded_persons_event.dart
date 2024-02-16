part of 'founded_persons_bloc.dart';

@immutable
abstract class FoundedPersonsEvent {}
class LoadFoundedPersonsEvent extends FoundedPersonsEvent{}
class UpdateFoundedPersonEvent extends FoundedPersonsEvent{
  final int personId;
  final Map <String , dynamic > updatedData;

  UpdateFoundedPersonEvent(this.personId, this.updatedData);
}

class DeleteFoundedPersonEvent extends FoundedPersonsEvent
{
  final int personId;

  DeleteFoundedPersonEvent(this.personId);
}


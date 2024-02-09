part of 'find_post_bloc.dart';

@immutable
abstract class FindPostEvent {}
class SubmitFormEvent extends  FindPostEvent
{
  final Map <String , dynamic> fromData;

  SubmitFormEvent({required this.fromData});

}

part of 'persons_bloc.dart';

@immutable
abstract class PersonsEvent {}
class GetFoundedPersonsEvent extends PersonsEvent {
  String? searchText;
  Gender searchByFoundedGender=Gender.all;
  bool searchFromCustomDate=false;
  DateTime? searchByFoundedOrMissingPersonDateFrom;
  bool sortByLastAdded=true;
  PersonType personType=PersonType.all;
  GetFoundedPersonsEvent({
    this.searchText,
    this.searchByFoundedGender=Gender.all,
    this.searchFromCustomDate=false,
    this.searchByFoundedOrMissingPersonDateFrom,
    this.sortByLastAdded=true,
    this.personType=PersonType.all
  });
}
class DeleteFoundedOrMissingPersonEvent extends PersonsEvent {
  int? foundedPersonId;
  PersonType personType;
  DeleteFoundedOrMissingPersonEvent({
    required this.foundedPersonId,
    required this.personType
  });
}
class AddFoundedOrMissingPersonEvent extends PersonsEvent {
  final PersonType personType;
  NewPostModel postModel;
  AddFoundedOrMissingPersonEvent({required this.postModel,required this.personType});
}


enum Gender {
  male,female,all
}

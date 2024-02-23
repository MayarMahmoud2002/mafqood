import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:mafqood/core/shared_widgets/flush_bar.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';
import 'package:meta/meta.dart';

import '../classes/get_founded_persons_response.dart';
import '../classes/get_missing_persons_response.dart';
import '../classes/new_post_model.dart';
import '../classes/post_model.dart';
import '../core/utilis/repository.dart';

part 'persons_event.dart';
part 'persons_state.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  final PersonsRepository personsRepository;


  PersonsBloc(this.personsRepository) : super(PersonsInitial()) {
    on<GetFoundedPersonsEvent>((event, emit) async {
      List <PostModel> posts = [];
      emit(GetFoundedPersonsLoading());
      try {
      var response=  await personsRepository.getFoundedPersons();
      GetFoundedPersonsResponse getFoundedPersonsResponse = GetFoundedPersonsResponse.fromJson(response);
      var response2=  await personsRepository.getMissingPersons();
      GetMissingPersonsResponse getMissingPersonsResponse = GetMissingPersonsResponse.fromJson(response2);
      for (var personData in getFoundedPersonsResponse.data!) {
        posts.add(PostModel(
          foundedOrMissingPersonCity: personData!.foundedperson!.city,
          foundedOrMissingPersonCountry: personData.foundedperson!.country,
          foundedOrMissingPersonDescription: personData.foundedperson!.description,
          foundedOrMissingPersonGender: personData.foundedperson!.gender,
            foundedOrMissingPersonFoundedOrMissingAt: personData.foundedperson!.foundedat,
          foundedOrMissingPersonId: personData.foundedperson!.id ,
          foundedOrMissingPersonImage: personData.foundedperson!.image,
          foundedOrMissingPersonName: personData.foundedperson!.name,
          foundedOrMissingPersonPoliceStation: personData.foundedperson!.policestation,
          foundedOrMissingPersonState: personData.foundedperson!.state,
          founderOrReporterCity: personData.founder!.city,
          founderOrReporterCountry:  personData.founder!.country,
            founderOrReporterGender:  personData.founder!.gender,
            founderOrReporterName:  personData.founder!.name,
            founderOrReporterPhone:  personData.founder!.phone,
            founderOrReporterProfileImage:  personData.founder!.profileimage,
            founderOrReporterState:  personData.founder!.state,
            personType: PersonType.foundedPerson
        ));
      }
      for (var personData in getMissingPersonsResponse.data!) {
        posts.add(PostModel(
          foundedOrMissingPersonCity: personData!.missingperson!.city,
          foundedOrMissingPersonCountry: personData.missingperson!.country,
          foundedOrMissingPersonDescription: personData.missingperson!.description,
          foundedOrMissingPersonGender: personData.missingperson!.gender,
            foundedOrMissingPersonFoundedOrMissingAt: personData.missingperson!.lostedat,
          foundedOrMissingPersonId: personData.missingperson!.id ,
          foundedOrMissingPersonImage: personData.missingperson!.image,
          foundedOrMissingPersonName: personData.missingperson!.name,
          foundedOrMissingPersonState: personData.missingperson!.state,
          founderOrReporterCity: personData.searchers!.first!.city,
          founderOrReporterCountry:  personData.searchers!.first!.country,
            founderOrReporterGender:  personData.searchers!.first!.gender,
            founderOrReporterName:  personData.searchers!.first!.name,
            founderOrReporterPhone:  personData.searchers!.first!.phone,
            founderOrReporterProfileImage:  personData.searchers!.first!.profileimage,
            founderOrReporterState:  personData.searchers!.first!.state,
            personType: PersonType.missingPerson
        ));
      }
      if (event.searchFromCustomDate) {
        posts = posts.where((element) {
          if (element.foundedOrMissingPersonFoundedOrMissingAt==null) {
            return true;
          }
          List <String> aDate = element.foundedOrMissingPersonFoundedOrMissingAt!.split("-");
          DateTime da = DateTime(int.parse(aDate[0]),int.parse(aDate[1]),int.parse(aDate[2]));
          return da.isAfter(event.searchByFoundedOrMissingPersonDateFrom!) || da.isAtSameMomentAs(event.searchByFoundedOrMissingPersonDateFrom!);
        }).toList();
      }
       if (event.sortByLastAdded) {
         posts.sort((a, b) {
           if (a.foundedOrMissingPersonFoundedOrMissingAt==null || b.foundedOrMissingPersonFoundedOrMissingAt==null) {
             return 0;
           }
           List <String> aDate = a.foundedOrMissingPersonFoundedOrMissingAt!.split("-");
            List <String> bDate = b.foundedOrMissingPersonFoundedOrMissingAt!.split("-");
            DateTime da = DateTime(int.parse(aDate[0]),int.parse(aDate[1]),int.parse(aDate[2]));
            DateTime db = DateTime(int.parse(bDate[0]),int.parse(bDate[1]),int.parse(bDate[2]));
            return db.compareTo(da);
         });
       }else{
          posts.sort((a, b) {
            if (a.foundedOrMissingPersonFoundedOrMissingAt==null || b.foundedOrMissingPersonFoundedOrMissingAt==null) {
              return 0;
            }
            List <String> aDate = a.foundedOrMissingPersonFoundedOrMissingAt!.split("-");
            List <String> bDate = b.foundedOrMissingPersonFoundedOrMissingAt!.split("-");
            DateTime da = DateTime(int.parse(aDate[0]),int.parse(aDate[1]),int.parse(aDate[2]));
            DateTime db = DateTime(int.parse(bDate[0]),int.parse(bDate[1]),int.parse(bDate[2]));
            return da.compareTo(db);
          });
        }
        if (event.searchText!=null && event.searchText!.isNotEmpty) {
          posts = posts.where((element)
          {
            bool temp1 = false;
            bool temp2 = false;
            bool temp3 = false;
            bool temp4 = false;
            bool temp5 = false;
            bool temp6 = false;
            bool temp7 = false;
            bool temp8 = false;
            bool temp9 = false;
            bool temp10 = false;
            bool temp11 = false;
            if (element.foundedOrMissingPersonName!=null){
              temp1 = element.foundedOrMissingPersonName!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.foundedOrMissingPersonDescription!=null){
              temp2 = element.foundedOrMissingPersonDescription!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.foundedOrMissingPersonCity!=null){
              temp3 = element.foundedOrMissingPersonCity!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.foundedOrMissingPersonCountry!=null){
              temp4 = element.foundedOrMissingPersonCountry!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.foundedOrMissingPersonState!=null){
              temp5 = element.foundedOrMissingPersonState!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.foundedOrMissingPersonPoliceStation!=null){
              temp6 = element.foundedOrMissingPersonPoliceStation!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.founderOrReporterName!=null){
              temp7 = element.founderOrReporterName!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.founderOrReporterCity!=null){
              temp8 = element.founderOrReporterCity!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.founderOrReporterCountry!=null){
              temp9 = element.founderOrReporterCountry!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.founderOrReporterState!=null){
              temp10 = element.founderOrReporterState!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            if (element.founderOrReporterPhone!=null){
              temp11 = element.founderOrReporterPhone!.toLowerCase().contains(event.searchText!.toLowerCase());
            }
            return temp1 || temp2 || temp3 || temp4 || temp5 || temp6 || temp7 || temp8 || temp9 || temp10 || temp11;
          }
          ).toList();
        }
        switch (event.personType) {
          case PersonType.all:
            break;
          case PersonType.foundedPerson:
            posts = posts.where((element) => element.personType==PersonType.foundedPerson).toList();
            break;
          case PersonType.missingPerson:
            posts = posts.where((element) => element.personType==PersonType.missingPerson).toList();
            break;
        }
        switch (event.searchByFoundedGender) {
          case Gender.all:
            break;
          case Gender.male:
            posts = posts.where((element) => (element.foundedOrMissingPersonGender=="male"?Gender.male:Gender.female)==Gender.male).toList();
            break;
          case Gender.female:
            posts = posts.where((element) => (element.foundedOrMissingPersonGender=="female"?Gender.male:Gender.female)==Gender.female).toList();
            break;
        }

        emit(GetFoundedPersonsSuccess(posts: posts,event: event));
      } catch (e) {
        showFlushBar(e.toString());
        emit(GetFoundedPersonsFailure(error: e.toString()));
      }
    },);
    on<DeleteFoundedOrMissingPersonEvent>((event, emit) async {
      emit(DeleteFoundedOrMissingPersonLoading());
      try {
        await personsRepository.deleteFoundedPerson(event.foundedPersonId!, event.personType);
        showFlushBar("Deleted Successfully", isError: false);
        emit(DeleteFoundedPersonSuccess());
      } catch (e) {
        showFlushBar(e.toString());
        emit(DeleteFoundedPersonFailure(error: e.toString()));
      }
    },);
    on<AddFoundedOrMissingPersonEvent>((event, emit) async {
      emit(AddFoundedOrMissingPersonLoading());
      String variable=event.personType==PersonType.missingPerson?"lost":"found";
      try {
        if (event.personType==PersonType.missingPerson&&(event.postModel.name==null || event.postModel.name!.isEmpty)) {
          emit (AddFoundedOrMissingPersonFailure(error: "Please enter the name of the person you $variable"));
        }
       else if (event.postModel.description==null || event.postModel.description!.isEmpty) {
          emit (AddFoundedOrMissingPersonFailure(error: 'Please enter the description of the person you $variable'));
        }
        else if ( event.postModel.country==null || event.postModel.country!.isEmpty) {
          emit (AddFoundedOrMissingPersonFailure(error: "Please enter the country where you $variable the person"));
        }
        else if (event.postModel.city==null || event.postModel.city!.isEmpty) {
          emit (AddFoundedOrMissingPersonFailure(error: "Please enter the city where you $variable the person"));
        }
        else if (event.postModel.state==null || event.postModel.state!.isEmpty) {
          emit (AddFoundedOrMissingPersonFailure(error: "Please enter the state where you $variable the person"));
        }
        else  if (event.postModel.gender==null || event.postModel.gender!.isEmpty) {
          emit (AddFoundedOrMissingPersonFailure(error: 'Please select the gender of the person you $variable'));
        }
        else if (event.postModel.date==null || event.postModel.date!.isEmpty) {
            emit (AddFoundedOrMissingPersonFailure(error: 'Please select the date when you lost the $variable'));
        }
        else if (event.postModel.image==null || event.postModel.image!.isEmpty) {
              emit (AddFoundedOrMissingPersonFailure(error: 'Please select the image of the person you $variable'));
        }else if (event.personType==PersonType.foundedPerson&&(event.postModel.policeStation==null || event.postModel.policeStation!.isEmpty)) {
          emit (AddFoundedOrMissingPersonFailure(error: "Please enter the police station where you found the person"));
        }
        await personsRepository.addFoundedOrMissingPerson(event.postModel,event.personType);
        emit(AddFoundedOrMissingPersonSuccess());
      } catch (e) {
        showFlushBar(e.toString());
        emit(AddFoundedOrMissingPersonFailure(error: e.toString()));
      }
    },);
  }
}

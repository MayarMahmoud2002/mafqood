import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../core/utilis/repository.dart';

part 'founded_persons_event.dart';
part 'founded_persons_state.dart';

class FoundedPersonsBloc extends Bloc<FoundedPersonsEvent, FoundedPersonsState> {
  final FoundedPersonsDataRepository repository;

  FoundedPersonsBloc(this.repository) : super(FoundedPersonsInitial()) {
    on<FoundedPersonsEvent>((event, emit) async  {
      if (event is LoadFoundedPersonsEvent)
      {
        emit (FoundedPersonsLoadingState());
        try
        {
          final foundedPersons = await repository.fetchFoundedPersons();
          emit(FoundedPersonsSuccessState(foundedPersons));
        }catch (e)
        {
          emit(FoundedPersonsErrorState(error: 'Failed to load founded persons: $e'));
        }

      // }else if (event is UpdateFoundedPersonEvent)
      // {
      //   emit (FoundedPersonsLoadingState());
      //   try
      //   {
      //     await repository.updateFoundedPerson(event.personId, event.updatedData);
      //     emit(FoundedPersonsUpdateSuccessState());
      //   }catch (e)
      //   {
      //     emit(FoundedPersonsErrorState(error: 'Failed to update founded person: $e'));
      //   }
      }else if (event is DeleteFoundedPersonEvent)
      {
        emit (FoundedPersonsLoadingState());
        try
        {
          await repository.deleteFoundedPerson(event.personId);
        }catch (e)
        {
          emit(FoundedPersonsErrorState(error: 'Failed to delete founded person: $e'));

        }


      }
    });
  }
}

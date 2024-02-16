import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/utilis/repository.dart';
import 'lost_persons_event.dart';
import 'lost_persons_state.dart';


class LostPersonsBloc extends Bloc<LostPersonsEvent, LostPersonsState> {
  final LostPersonsDataRepository repository;

  LostPersonsBloc(this.repository) : super(LostPersonsInitial()) {
    on<LostPersonsEvent>((event, emit) async  {
      if (event is LoadLostPersonsEvent)
      {
        emit (LostPersonsLoadingState());
        try
        {
          final foundedPersons = await repository.fetchLostPersons();
          emit(LostPersonsSuccessState(foundedPersons));
        }catch (e)
        {
          emit(LostPersonsErrorState(error: 'Failed to load lost persons: $e'));
        }

      }else if (event is UpdateLostPersonEvent)
      {
        emit (LostPersonsLoadingState());
        try
        {
          await repository.updateLostPerson(event.personId, event.updatedData);
          emit(LostPersonsUpdateSuccessState());
        }catch (e)
        {
          emit(LostPersonsErrorState(error: 'Failed to update lost person: $e'));
        }
      }else if (event is DeleteLostPersonEvent)
      {
        emit (LostPersonsLoadingState());
        try
        {
          await repository.deleteLostPerson(event.personId);
        }catch (e)
        {
          emit(LostPersonsErrorState(error: 'Failed to delete lost person: $e'));
        }
      }
    });
  }
}


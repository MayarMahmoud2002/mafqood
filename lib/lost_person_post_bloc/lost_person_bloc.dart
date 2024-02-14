import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../core/utilis/repository.dart';

part 'lost_person_event.dart';
part 'lost_person_state.dart';

class LostPersonBloc extends Bloc<LostPersonEvent, LostPersonState> {
  LostPersonBloc(LostPostRepository lostPostRepository) : super(LostPersonInitial()) {
    on<LostPersonEvent>((event, emit) async {
      if (event is SubmitLostFormEvent)
      {
        emit(LostPostLoadingState());
        try {
          await LostPostRepository().createLostPost(event.fromData);
          emit (LostPostSuccessState());
        } catch (e)
        {
          emit (LostPostErrorState(error : 'Failed to create post'));
        }
      }else if (event is UpdateLostFormEvent) {
        emit(LostPostUpdateLoadingState());
        try {
          await FoundedPostRepository().updateFoundedPerson(event.personId, event.updatedData);
          emit(LostPostUpdateSuccessState());
        } catch (e) {
          emit(LostPostUpdateErrorState(error: 'Failed to update post'));
        }
      }
    });
  }
}

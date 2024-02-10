import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../core/utilis/repository.dart';

part 'missing_person_event.dart';
part 'missing_person_state.dart';

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
      }
    });
  }
}

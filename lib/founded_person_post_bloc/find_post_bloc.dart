import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../core/utilis/repository.dart';
part 'find_post_event.dart';
part 'find_post_state.dart';

class FindPostBloc extends Bloc<FindPostEvent, FindPostState> {

  FindPostBloc(FoundedPostRepository foundedPostRepository) : super(FindPostInitial())
  {
    on<FindPostEvent>((event, emit) async*{
      if (event is SubmitFormEvent) {
        emit(FindPostLoadingState());
        try {
          await FoundedPostRepository().createFoundPost(event.fromData);
          emit(FindPostSuccessState());
        } catch (e) {
          emit(FindPostErrorState(error: 'Failed to create post'));
        }
      } else if (event is SelectGenderEvent) {
        emit(FindPostGenderSelectedState(event.gender));
      } else if (event is UpdateFormEvent) {
        emit(FindPostUpdateLoadingState());
        try {
          await FoundedPostRepository().updateFoundedPerson(event.personId, event.updatedData);
          emit(FindPostUpdateSuccessState());
        } catch (e) {
          emit(FindPostUpdateErrorState(error: 'Failed to update post'));
        }
      }
    });
  }
}

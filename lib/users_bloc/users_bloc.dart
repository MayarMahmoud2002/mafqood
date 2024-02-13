import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqood/users_bloc/users_event.dart';
import 'package:mafqood/users_bloc/users_state.dart';
import '../core/utilis/repository.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersDataRepository repository;

  UsersBloc(this.repository) : super(UsersInitial()) {
    on<UsersEvent>((event, emit) async {
      if (event is LoadUsersEvent) {
        emit(UsersLoadingState());
        try {
          final usersData = await repository.fetchUsers();
          emit(UsersSuccessState(usersData));
        } catch (e) {
          emit(UsersErrorState(error: 'Failed to load users: $e'));
        }
      }
    });
  }
}

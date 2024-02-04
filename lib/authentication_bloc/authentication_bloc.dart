import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:mafqood/core/utilis/app_contances.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc(this.authenticationRepository) : super(AuthenticationInitial()){
    on<SignInEvent>(
          (event, emit) async {
        if (event.phone.isEmpty || event.password.isEmpty) {
          emit(AuthenticationFailure(error: 'Phone and password cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.signIn(phone: event.phone,password: event.password,);
          emit(AuthenticationSuccess(token: token));
        } catch (e) {
          emit(AuthenticationFailure(error: 'An error occurred: $e'));
        }
      },
    );
    // on<RegisterEvent>(
    //   (event, emit) async {
    //     if (event.phone.isEmpty || event.password.isEmpty) {
    //       emit(AuthenticationFailure(error: 'Phone and password cannot be empty'));
    //       return;
    //     }
    //     emit(AuthenticationLoading());
    //
    //     try {
    //       final token = await authenticationRepository.register(phone: event.phone,password: event.password,);
    //       emit(AuthenticationSuccess(token: token));
    //     } catch (e) {
    //       emit(AuthenticationFailure(error: 'An error occurred: $e'));
    //     }
    //   },
    // );

  }


}



class AuthenticationRepository {
  final Dio _dio = Dio();

  Future<String> signIn({required String phone, required String password}) async {
    try {
      final response = await _dio.post(AppContances.loginPath, data: {
        'phone': phone,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
}
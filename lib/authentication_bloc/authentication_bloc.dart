
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc(this.authenticationRepository) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is SignInEvent) {
      yield AuthenticationLoading();

      try {
        final token = await authenticationRepository.signIn(phone: event.phone,password: event.password,);
        yield AuthenticationSuccess(token: token);
      } catch (e) {
        yield AuthenticationFailure(error: 'An error occurred: $e');}
    }
  }
}

class AuthenticationRepository {
  final Dio _dio = Dio();

  Future<String> signIn({required String phone, required String password}) async {
    try {
      final response = await _dio.post('loginPath', data: {
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
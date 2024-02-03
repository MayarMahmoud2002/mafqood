
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
        Dio dio = Dio();
        final response = await dio.post('https://project-mafqoud.000webhostapp.com/api/auth/login', data: {
          'phone': event.phone,
          'password': event.password,
        });

        if (response.statusCode == 200) {
          yield AuthenticationSuccess(token: response.data['token']);
        } else {
          yield AuthenticationFailure(error: 'Authentication failed');
        }
      } catch (e) {
        yield AuthenticationFailure(error: 'An error occurred');
      }
    }
  }
}

class AuthenticationRepository {
  final Dio _dio = Dio();

  Future<String> signIn({required String phone, required String password}) async {
    try {
      // Replace the URL with your actual API endpoint
      final response = await _dio.post('https://project-mafqoud.000webhostapp.com/api/auth/login', data: {
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
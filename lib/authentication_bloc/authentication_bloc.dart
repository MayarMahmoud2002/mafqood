import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:mafqood/core/utilis/app_contances.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc(this.authenticationRepository) : super(AuthenticationInitial()){
    on<SignInEvent>((event, emit) async {
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
      },);
    on<RegisterNamePasswordEvent>((event, emit) async {
        if (event.name.isEmpty || event.password.isEmpty ) {
          emit(AuthenticationFailure(error: 'name and password cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.registerNamePassword(name: event.name,password: event.password,);
          emit(AuthenticationSuccess(token: token));
        } catch (e) {
          emit(AuthenticationFailure(error: 'An error occurred: $e'));
        }
      },);

    on<RegisterResetPasswordEvent>((event, emit) async {
      if (event.password.isEmpty) {
        emit(AuthenticationFailure(error: 'reset password cannot be empty'));
        return;
      }
      emit(AuthenticationLoading());

      try {
        final token = await authenticationRepository.registerResetPassword(resetPassword: event.password,);
        emit(AuthenticationSuccess(token: token));
      } catch (e) {
        emit(AuthenticationFailure(error: 'An error occurred: $e'));
      }
    },);

    on<RegisterLocationEvent>((event, emit) async {
        if (event.country.isEmpty || event.city.isEmpty || event.state.isEmpty) {
          emit(AuthenticationFailure(error: 'country , city and state cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.registerLocation(country: event.country,city: event.city,  state: event.state,);
          emit(AuthenticationSuccess(token: token));
        } catch (e) {
          emit(AuthenticationFailure(error: 'An error occurred: $e'));
        }
      },);
    on<RegisterProfileEvent>((event, emit) async {
        if (event.profileImage.isEmpty || event.gender.isEmpty ) {
          emit(AuthenticationFailure(error: 'profileImage and gender cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.registerProfile(profileImage: event.profileImage,gender: event.gender);
          emit(AuthenticationSuccess(token: token));
        } catch (e) {
          emit(AuthenticationFailure(error: 'An error occurred: $e'));
        }
      },);
    on<RegisterIdImagesEvent>((event, emit) async {
        if (event.nationalIdFrontImage.isEmpty || event.nationalIdBackImage.isEmpty ) {
          emit(AuthenticationFailure(error: 'nationalIdFrontImage and nationalIdFrontImage cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.registerIdImages(nationalIdFrontImage: event.nationalIdFrontImage,nationalIdBackImage: event.nationalIdBackImage);
          emit(AuthenticationSuccess(token: token));
        } catch (e) {
          emit(AuthenticationFailure(error: 'An error occurred: $e'));
        }
      },);
    on<GenerateOTPEvent>((event, emit) async {
        if (event.phone.isEmpty ) {
          emit(AuthenticationFailure(error: 'phone cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.generateOTP(phone: event.phone);
          emit(AuthenticationSuccess(token: token));
        } catch (e) {
          emit(AuthenticationFailure(error: 'An error occurred: $e'));
        }
      },);
    on<CheckOTPEvent>((event, emit) async {
        if (event.otp.isEmpty ) {
          emit(AuthenticationFailure(error: 'otp cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.checkOTP(otp: event.otp);
          emit(AuthenticationSuccess(token: token));
        } catch (e) {
          emit(AuthenticationFailure(error: 'An error occurred: $e'));
        }
      },
    );
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
  Future<String> registerNamePassword({required String name, required String password }) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'phone': name,
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
  Future<String> registerResetPassword({required String resetPassword }) async {
    try {
      final response = await _dio.post(AppContances.restPasswordPath, data: {
        'password': resetPassword,
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
  Future<String> registerLocation({required String country, required String city , required String state}) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'country': country,
        'city': city,
        'state': state,

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
  Future<String> registerProfile({required String profileImage,required String gender}) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'profile_image': profileImage,
        'gender': gender,
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
  Future<String> registerIdImages({required String nationalIdFrontImage,required String nationalIdBackImage}) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'national_id_front_image': nationalIdFrontImage,
        'national_id_back_image': nationalIdBackImage,
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
  Future<String> generateOTP({required String phone}) async {
    try {
      final response = await _dio.post(AppContances.generateOtpCodePath, data: {
        'phone': phone,
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
  Future<String> checkOTP({required String otp}) async {
    try {
      final response = await _dio.post(AppContances.checkOtpCodePath, data: {
        'otp_code': otp,
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
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'authentication_repository.dart';
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




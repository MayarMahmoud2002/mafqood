import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../core/utilis/repository.dart';
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
    on<RegisterGenderAndImageProfileEvent>((event, emit) async {
        if (event.gender.isEmpty  || event.gender.isEmpty) {
          emit(AuthenticationFailure(error: 'Gender or Profile Image cannot be empty'));
          return;
        }
        emit(AuthenticationLoading());

        try {
          final token = await authenticationRepository.registerGenderAndImageProfile(imageProfile: event.imageProfile, gender: event.gender);
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
//************************************************************************************************

// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   final ProfileRepository profileRepository;
//
//   ProfileBloc(this.profileRepository) : super(ProfileLoading());
//
//   @override
//   Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
//     if (event is FetchProfileEvent) {
//       yield* _mapFetchProfileDataToState();
//     } else if (event is UpdateProfileEvent) {
//       yield* _mapUpdateProfileDataToState(event.updatedData);
//     } else if (event is DeleteProfileEvent) {
//       yield* _mapDeleteProfileDataToState();
//     }
//   }
//   Stream<ProfileState> _mapFetchProfileDataToState() async* {
//     try {
//       final profileData = await profileRepository.fetchProfile();
//       yield ProfileLoaded(profileData);
//     } catch (e) {
//       yield ProfileError(error: 'Failed to fetch profile data');
//     }
//   }
//   Stream<ProfileState> _mapUpdateProfileDataToState(Map<String, dynamic> updatedData) async* {
//     try {
//       await profileRepository.updateProfile(updatedData);
//       final profileData = await profileRepository.fetchProfile();
//       yield ProfileLoaded(profileData);
//     } catch (e) {
//       yield ProfileError(error: 'Failed to update profile data');
//     }
//   }
//   Stream<ProfileState> _mapDeleteProfileDataToState() async* {
//     try {
//       await profileRepository.deleteProfile();
//       yield ProfileDeleted();
//     } catch (e) {
//       yield ProfileError(error: 'Failed to delete profile');
//     }
//   }
// }






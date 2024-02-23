import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';
import 'package:meta/meta.dart';

import '../core/shared_widgets/flush_bar.dart';
import '../core/utilis/repository.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;


  AuthenticationBloc(this.authenticationRepository) : super(AuthenticationInitial()){
    on<SignInEvent>((event, emit) async {
        if (event.phone.isEmpty || event.password.isEmpty) {
          emit(SignInFailure(error: 'Phone and password cannot be empty'));
          return;
        }
        emit(SignInLoading());
        try {
          final token = await authenticationRepository.signIn(phone: event.phone,password: event.password,);
          print ('token is $token');
          DeskStorage().setAuthenticatedData(event.phone, token, 1, event.phone, 'user');
          emit(SignInSuccess(token: token));
        } catch (e) {
          emit(SignInFailure(error: e.toString()));
        }
      },);
    on<RegisterNamePasswordEvent>((event, emit) async {
        if (event.name.isEmpty || event.password.isEmpty  || event.confirmPassword.isEmpty ) {
          emit(RegisterNamePasswordFailure(error: 'name and password cannot be empty'));
          return;
        }else if (event.password.length<8)
        {
          emit(RegisterNamePasswordFailure(error: 'password must be at least 8 characters'));
          return;
        }else if (!hasRequiredCharacters(event.password)){
          emit(RegisterNamePasswordFailure(error: 'password must contain at least one uppercase letter, one lowercase letter, and one special character'));
          return;
        }
        else if (event.password != event.confirmPassword)
        {
          emit(RegisterNamePasswordFailure(error: 'password and confirm password are not the same'));
          return;
        }
        emit(RegisterNamePasswordLoading());
        try {
          await authenticationRepository.registerNamePassword(name: event.name,password: event.password,);
          emit(RegisterNamePasswordSuccess());
        } catch (e) {
          emit(RegisterNamePasswordFailure(error: e.toString()));
        }
      },);
    // on<RegisterResetPasswordEvent>((event, emit) async {
    //   if (event.password.isEmpty) {
    //     emit(AuthenticationFailure(error: 'reset password cannot be empty'));
    //     return;
    //   }
    //   emit(AuthenticationLoading());
    //
    //   try {
    //     final token = await authenticationRepository.registerResetPassword(resetPassword: event.password,);
    //     emit(AuthenticationSuccess(token: token));
    //   } catch (e) {
    //     emit(AuthenticationFailure(error: 'An error occurred: $e'));
    //   }
    // },);
    on<RegisterLocationEvent>((event, emit) async {
        if (event.country.isEmpty || event.city.isEmpty || event.state.isEmpty) {
          emit(RegisterLocationFailure(error: 'country , city and state cannot be empty'));
          return;
        }
        emit(RegisterLocationLoading());
        try {
          await authenticationRepository.registerLocation(country: event.country,city: event.city,state: event.state);
          emit(RegisterLocationSuccess());
        } catch (e) {
          emit(RegisterLocationFailure(error: e.toString()));
        }
      },);
    on<RegisterGenderAndImageProfileEvent>((event, emit) async {
        if (event.gender.isEmpty  || event.gender.isEmpty) {
          emit(RegisterGenderAndImageProfileFailure(error: 'Gender and Profile Image cannot be empty'));
          return;
        }else if (event.gender!="male" && event.gender!="female")
        {
          emit(RegisterGenderAndImageProfileFailure(error: "Please Enter one of these values (male or female)"));
          return;
        }
        emit(RegisterGenderAndImageProfileLoading());
        try {
          await authenticationRepository.registerGenderAndImageProfile(gender:  event.gender,imageProfile: event.imageProfile);
          emit(RegisterGenderAndImageProfileSuccess());
        } catch (e) {
          emit(RegisterGenderAndImageProfileFailure(error: e.toString()));
        }
      },);
    on<RegisterIdImagesEvent>((event, emit) async {
        if (event.nationalIdFrontImage.isEmpty || event.nationalIdBackImage.isEmpty ) {
          emit(RegisterIdImagesFailure(error: 'national id front image and national id back image cannot be empty'));
          return;
        }
        emit(RegisterIdImagesLoading());
        try {
          await authenticationRepository.registerIdImages(nationalIdFrontImage: event.nationalIdFrontImage,nationalIdBackImage: event.nationalIdBackImage);
          emit(RegisterIdImagesSuccess());
        } catch (e) {
          emit(RegisterIdImagesFailure(error: e.toString()));
        }
      },);
    on<SendRegisterRequestEvent>((event, emit) async {
        if (event.phone.isEmpty ) {
          emit(SendRegisterRequestFailure(error: 'phone cannot be empty'));
          return;
        }
        emit(SendRegisterRequestLoading());
        try {
          await authenticationRepository.register(phone: event.phone);
          emit(SendRegisterRequestSuccess());
        } catch (e) {
          print("ايرورررر هنااااااااا");
          emit(SendRegisterRequestFailure(error: e.toString()));
        }
      },);
    on<GenerateOTPEvent>((event, emit) async {
      print (event.phone +"GenerateOTPEvent");
        if (event.phone.isEmpty ) {
          emit(GenerateOTPFailure(error: 'phone cannot be empty'));
          return;
        }
        emit(GenerateOTPLoading());

        try {
       var resonse=  await authenticationRepository.generateOTP(phone: event.phone);
       print ('resonse is $resonse');
          emit(GenerateOTPSuccess());
        } catch (e) {
          emit(GenerateOTPFailure(error: e.toString()));
        }
      },);
    on<CheckOTPEvent>((event, emit) async {
        if (event.otp.isEmpty ) {
          emit(VerifyOTPFailure(error: 'otp cannot be empty'));
          return;
        }
        emit(VerifyOTPLoading());
        try {
          final token = await authenticationRepository.checkOTP(otp: event.otp);
          emit(VerifyOTPSuccess());
        } catch (e) {
          emit(VerifyOTPFailure(error: e.toString()));
        }
      },);
    on<UpdatePasswordEvent>((event, emit) async {
        if (event.phone.isEmpty || event.newPassword.isEmpty || event.confirmPassword.isEmpty) {
          emit(UpdatePasswordFailure(error: 'phone , new password and confirm password cannot be empty'));
          return;
        }else if (event.newPassword.length<8)
        {
          emit(UpdatePasswordFailure(error: 'password must be at least 8 characters'));
          return;
        }else if (!hasRequiredCharacters(event.newPassword)){
          emit(UpdatePasswordFailure(error: 'password must contain at least one uppercase letter, one lowercase letter, and one special character'));
          return;
        }
        else if (event.newPassword != event.confirmPassword)
        {
          emit(UpdatePasswordFailure(error: 'password and confirm password are not the same'));
          return;
        }
        emit(UpdatePasswordLoading());
        try {
          await authenticationRepository.updatePassword(phone: event.phone,newPassword: event.newPassword);
          emit(UpdatePasswordSuccess());
        } catch (e) {
          emit(UpdatePasswordFailure(error: e.toString()));
        }
      },);

  }
  bool hasRequiredCharacters(String input) {
    // Define regex patterns to match uppercase, lowercase, and special characters
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp specialCharRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

    // Check if the input string matches all three patterns
    return uppercaseRegex.hasMatch(input) &&
        lowercaseRegex.hasMatch(input) &&
        specialCharRegex.hasMatch(input);
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






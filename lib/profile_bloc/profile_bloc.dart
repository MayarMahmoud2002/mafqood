import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mafqood/classes/get_profile_data.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';
import 'package:meta/meta.dart';
import '../classes/post_model.dart';
import '../core/utilis/repository.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<GetProfileDataEvent>((event, emit) async {
      emit(GetProfileDataLoading());
      try {
        var response = await profileRepository.fetchProfile();
        GetProfileDataResponse getProfileDataResponse = GetProfileDataResponse.fromJson(response);
        print(getProfileDataResponse.data!.first!.user!.name!);
        emit(GetProfileDataSuccess(user: getProfileDataResponse.data!.first!.user!));
      } catch (e) {
        emit(GetProfileDataFailure(error: e.toString()));
      }
    },);
    on<DeleteProfileEvent>((event, emit) async {
      emit(DeleteProfileLoading());
      try {
         await DeskStorage().logout().then((value) {
          emit(DeleteProfileSuccess());
        });
      } catch (e) {
        emit(DeleteProfileFailure(error: e.toString()));
      }
    },);
    on<UpdateProfileEvent>((event, emit) async {
      emit(UpdateProfileLoading());
      try {
        await profileRepository.updateProfile(
          imgPath: event.imgPath,
          name: event.name,
          country: event.country,
          state: event.state,
          city: event.city,
          gender: event.gender
        );
        emit(UpdateProfileSuccess());
      } catch (e) {
        emit(UpdateProfileFailure(error: e.toString()));
      }
    });

  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../core/utilis/repository.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository) : super(ProfileLoadingState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileEvent) {
      yield* _mapFetchProfileDataToState();
    } else if (event is UpdateProfileEvent) {
      yield* _mapUpdateProfileDataToState(event.updatedData);
    } else if (event is DeleteProfileEvent) {
      yield* _mapDeleteProfileDataToState();
    }
  }
  Stream<ProfileState> _mapFetchProfileDataToState() async* {
    try {
      final profileData = await profileRepository.fetchProfile();
      yield ProfileLoadedState(profileData);
    } catch (e) {
      yield ProfileErrorState(error: 'Failed to fetch profile data');
    }
  }
  Stream<ProfileState> _mapUpdateProfileDataToState(Map<String, dynamic> updatedData) async* {
    try {
      await profileRepository.updateProfile(updatedData);
      final profileData = await profileRepository.fetchProfile();
      yield ProfileLoadedState(profileData);
    } catch (e) {
      yield ProfileErrorState(error: 'Failed to update profile data');
    }
  }
  Stream<ProfileState> _mapDeleteProfileDataToState() async* {
    try {
      await profileRepository.deleteProfile();
      yield ProfileDeletedState();
    } catch (e) {
      yield ProfileErrorState(error: 'Failed to delete profile');
    }
  }
}

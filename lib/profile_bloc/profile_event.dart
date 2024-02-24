part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class GetProfileDataEvent extends ProfileEvent{
}
class UpdateProfileEvent extends ProfileEvent {
  String? name;
  String? country;
  String? state;
  String? city;
  String? gender;
  String? imgPath;

  UpdateProfileEvent({this.name, this.country, this.state,this.gender,this.city,this.imgPath});
}
class DeleteProfileEvent extends ProfileEvent{}

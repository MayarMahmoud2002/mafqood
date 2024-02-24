
class DatumP {
  User? user;

  DatumP({this.user});

  DatumP.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
  }

}

class GetProfileDataResponse {
  int? status;
  String? message;
  List<DatumP?>? data;

  GetProfileDataResponse({this.status, this.message, this.data});

  GetProfileDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DatumP>[];
      json['data'].forEach((v) {
        data!.add(DatumP.fromJson(v));
      });
    }
  }

}

class User {
  String? name;
  String? phone;
  String? gender;
  String? country;
  String? state;
  String? city;
  String? profileimage;

  User({this.name, this.phone, this.gender, this.country, this.state, this.city, this.profileimage});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    profileimage = json['profile_image'];
  }

}



class DatumM {
  MissingPerson? missingperson;
  List<Searcher?>? searchers;

  DatumM({this.missingperson, this.searchers});

  DatumM.fromJson(Map<String, dynamic> json) {
    missingperson = json['missing_person'] != null ? MissingPerson?.fromJson(json['missing_person']) : null;
    if (json['searchers'] != null) {
      searchers = <Searcher>[];
      json['searchers'].forEach((v) {
        searchers!.add(Searcher.fromJson(v));
      });
    }
  }

}

class MissingPerson {
  int? id;
  String? name;
  String? gender;
  String? description;
  String? country;
  String? state;
  String? city;
  String? lostedat;
  String? image;

  MissingPerson({this.id, this.name, this.gender, this.description, this.country, this.state, this.city, this.lostedat, this.image});

  MissingPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    description = json['description'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    lostedat = json['losted_at'];
    image = json['image'];
  }

}

class GetMissingPersonsResponse {
  int? status;
  String? message;
  List<DatumM?>? data;

  GetMissingPersonsResponse({this.status, this.message, this.data});

  GetMissingPersonsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DatumM>[];
      json['data'].forEach((v) {
        data!.add(DatumM.fromJson(v));
      });
    }
  }

}

class Searcher {
  String? name;
  String? phone;
  String? gender;
  String? country;
  String? state;
  String? city;
  String? profileimage;

  Searcher({this.name, this.phone, this.gender, this.country, this.state, this.city, this.profileimage});

  Searcher.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    profileimage = json['profile_image'];
  }

}


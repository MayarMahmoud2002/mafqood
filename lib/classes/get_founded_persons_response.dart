
class DatumF {
  FoundedPerson? foundedperson;
  Founder? founder;

  DatumF({this.foundedperson, this.founder});

  DatumF.fromJson(Map<String, dynamic> json) {
    foundedperson = json['founded_person'] != null ? FoundedPerson?.fromJson(json['founded_person']) : null;
    founder = json['founder'] != null ? Founder?.fromJson(json['founder']) : null;
  }

}

class FoundedPerson {
  int? id;
  String? name;
  String? gender;
  String? description;
  String? country;
  String? state;
  String? city;
  String? policestation;
  String? foundedat;
  String? image;

  FoundedPerson({this.id, this.name, this.gender, this.description, this.country, this.state, this.city, this.policestation, this.foundedat, this.image});

  FoundedPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    description = json['description'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    policestation = json['police_station'];
    foundedat = json['founded_at'];
    image = json['image'];
  }

}

class Founder {
  String? name;
  String? phone;
  String? gender;
  String? country;
  String? state;
  String? city;
  String? profileimage;

  Founder({this.name, this.phone, this.gender, this.country, this.state, this.city, this.profileimage});

  Founder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    profileimage = json['profile_image'];
  }

}

class GetFoundedPersonsResponse {
  int? status;
  String? message;
  List<DatumF?>? data;

  GetFoundedPersonsResponse({this.status, this.message, this.data});

  GetFoundedPersonsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DatumF>[];
      json['data'].forEach((v) {
        data!.add(DatumF.fromJson(v));
      });
    }
  }

}


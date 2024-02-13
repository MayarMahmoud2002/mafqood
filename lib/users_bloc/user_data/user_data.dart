class UserData {
  final User user;
  final List<MissingPerson> missingPeople;
  final List<FoundedPerson> foundedPeople;

  UserData({
    required this.user,
    required this.missingPeople,
    required this.foundedPeople,
  });
}

class User {
  final String name;
  final String phone;
  final String gender;
  final String profileImage;

  User({
    required this.name,
    required this.phone,
    required this.gender,
    required this.profileImage,
  });
}

class MissingPerson {
  final int id;
  final String name;
  final String gender;
  final String description;
  final String country;
  final String state;
  final String city;
  final String? lostedAt;
  final String image;

  MissingPerson({
    required this.id,
    required this.name,
    required this.gender,
    required this.description,
    required this.country,
    required this.state,
    required this.city,
    this.lostedAt,
    required this.image,
  });
}

class FoundedPerson {
  final int id;
  final String name;
  final String gender;
  final String description;
  final String country;
  final String state;
  final String city;
  final String policeStation;
  final String foundedAt;
  final String image;

  FoundedPerson({
    required this.id,
    required this.name,
    required this.gender,
    required this.description,
    required this.country,
    required this.state,
    required this.city,
    required this.policeStation,
    required this.foundedAt,
    required this.image,
  });
}

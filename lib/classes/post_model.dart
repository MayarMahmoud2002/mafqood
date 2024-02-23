class PostModel{
  int? foundedOrMissingPersonId=0;
  String? foundedOrMissingPersonName="";
  String? foundedOrMissingPersonGender="";
  String? foundedOrMissingPersonDescription="";
  String? foundedOrMissingPersonCountry="";
  String? foundedOrMissingPersonState="";
  String? foundedOrMissingPersonCity="";
  String? foundedOrMissingPersonPoliceStation="";
  String? foundedOrMissingPersonFoundedOrMissingAt="";
  String? foundedOrMissingPersonImage="";
  String? founderOrReporterName="";
  String? founderOrReporterPhone="";
  String? founderOrReporterGender="";
  String? founderOrReporterCountry="";
  String? founderOrReporterState="";
  String? founderOrReporterCity="";
  String? founderOrReporterProfileImage="";
  PersonType? personType;
  PostModel({
    this.foundedOrMissingPersonId,
    this.foundedOrMissingPersonName,
    this.foundedOrMissingPersonGender,
    this.foundedOrMissingPersonDescription,
    this.foundedOrMissingPersonCountry,
    this.foundedOrMissingPersonState,
    this.foundedOrMissingPersonCity,
    this.foundedOrMissingPersonPoliceStation,
    this.foundedOrMissingPersonFoundedOrMissingAt,
    this.foundedOrMissingPersonImage,
    this.founderOrReporterName,
    this.founderOrReporterPhone,
    this.founderOrReporterGender,
    this.founderOrReporterCountry,
    this.founderOrReporterState,
    this.founderOrReporterCity,
    this.founderOrReporterProfileImage,
    this.personType
  });
}

enum PersonType{
  foundedPerson,
  missingPerson,
  all
}
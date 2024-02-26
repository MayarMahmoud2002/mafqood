import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class DeskStorage with ChangeNotifier{
  static const secureStorage = FlutterSecureStorage();

  static String? token;
  static String? userName;
  static int? pK;

  static String? userType;
  static String? mobile;

  setAuthenticatedData(String username, String userToken, int pk,
      String mobileS,
      String usertype) async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Auth',
        encryptionCipher: HiveAesCipher(encryptionKey));
    token = userToken;
    userName = username;
    userType = usertype;
    pK = pk;
    mobile = mobileS;
    await hive.put('username', username);
    await hive.put('token', userToken);
    await hive.put('userId', pk);
    await hive.put('userType', usertype);
    await hive.put('mobile', mobileS);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  getAllAuthenticatedData() async {
    print('getAllAuthenticatedData');
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Auth',
        encryptionCipher: HiveAesCipher(encryptionKey));
    token = await hive.get('token');
    userName = await hive.get('username');
    pK = await hive.get('userId');
    userType = await hive.get('userType');
    mobile = await hive.get('mobile');
    notifyListeners();
  }


  logout() async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Auth',
        encryptionCipher: HiveAesCipher(encryptionKey));
    await hive.delete('username');
    await hive.delete('token');
    await hive.delete('userId');
    await hive.delete('userType');
    await hive.delete('mobile');
    await hive.deleteFromDisk();
    notifyListeners();
  }


  getLanguage() async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Settings',
        encryptionCipher: HiveAesCipher(encryptionKey));
    var lang = await hive.get('language');
    return lang;
  }

  void setLanguage(String languageCode) async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Settings',
        encryptionCipher: HiveAesCipher(encryptionKey));
    hive.put('language', languageCode);

  }


  getToken() async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Auth',
        encryptionCipher: HiveAesCipher(encryptionKey));
    var token = await hive.get('token');
    return token;
  }

  setNameAndPasswordRegistered(String username, String password) async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Temp',
        encryptionCipher: HiveAesCipher(encryptionKey));
    await hive.put('username', username);
    await hive.put('password', password);
    print ('username: $username');
    print ('password: $password');
  }

  setLocationRegister(String country, String state, String city) async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Temp',
        encryptionCipher: HiveAesCipher(encryptionKey));
    await hive.put('country', country);
    await hive.put('state', state);
    await hive.put('city', city);
    print ('country: $country');
    print ('state: $state');
    print ('city: $city');
  }

  setGenderAndImageRegister(String gender, String imageProfile) async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Temp',
        encryptionCipher: HiveAesCipher(encryptionKey));
    await hive.put('gender', gender);
    await hive.put('imageProfile', imageProfile);
    print ('gender$gender');
    print ('imageProfile$imageProfile');

  }

  setIdImagesRegister(String nationalIdFrontImage,
      String nationalIdBackImage) async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Temp',
        encryptionCipher: HiveAesCipher(encryptionKey));
    await hive.put('nationalIdFrontImage', nationalIdFrontImage);
    await hive.put('nationalIdBackImage', nationalIdBackImage);
    print ('nationalIdFrontImage$nationalIdFrontImage');
    print ('nationalIdBackImage$nationalIdBackImage');
  }

  getRegisterData() async {
    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    var hive = await Hive.openBox('Temp',
        encryptionCipher: HiveAesCipher(encryptionKey));
    var country = await hive.get('country');
    var state = await hive.get('state');
    var city = await hive.get('city');
    var name = await hive.get('username');
    var password = await hive.get('password');
    var gender = await hive.get('gender');
    var imageProfile = await hive.get('imageProfile');
    var nationalIdFrontImage = await hive.get('nationalIdFrontImage');
    var nationalIdBackImage = await hive.get('nationalIdBackImage');
    return RegisterData(
        country: country,
        state: state,
        city: city,
        name: name,
        password: password,
        gender:gender,
        imageProfile: imageProfile,
        nationalIdFrontImage: nationalIdFrontImage,
        nationalIdBackImage: nationalIdBackImage);
  }
}
class RegisterData{
  final String? country;
  final String? state;
  final String? city;
  final String? name;
  final String? password;
  final String? gender;
  final String? imageProfile;
  final String? nationalIdFrontImage;
  final String? nationalIdBackImage;
  RegisterData({this.country, this.state, this.city, this.name, this.password,
  this.gender, this.imageProfile, this.nationalIdFrontImage, this.nationalIdBackImage});


  }

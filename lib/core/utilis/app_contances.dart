import 'package:flutter/material.dart';

import 'navigation_service.dart';

class AppConstances

{
  static const String baseUrl = 'https://mafqoud.xyz/';
  static const String loginPath = 'api/auth/login';
  static const String registerPath = 'api/auth/register';
  static const String restPasswordPath = 'api/auth/password/reset';
  static const String generateOtpCodePath = 'api/auth/otp/generate';
  static const String checkOtpCodePath = 'api/auth/otp/check';
  static const String profilePath = 'api/user/get';
  static const String updateProfilePath = 'api/user/update';
  static const String deleteProfilePath = 'api/user/delete';
  static const String foundedPostPath = 'api/foundedPerson/add';
  static const String missingPostPath = 'api/missingPerson/add';
  static const String foundedPersonDataPath = 'api/foundedPerson/get/all';
  static const String updateFoundedPersonPath = 'api/foundedPerson/update';
  static const String deleteFoundedPersonPath = 'api/foundedPerson/delete';
  static const String lostPersonDataPath = 'api/missingPerson/get/all';
  static const String updateLostPersonPath = 'api/missingPerson/update';
  static const String deleteLostPersonPath = 'api/missingPerson/delete';
  static const String getAllUsersPath = 'api/user/get/all';

  final size = MediaQuery.of(NavigationService.context!).size;



}


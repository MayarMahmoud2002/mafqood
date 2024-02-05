import 'package:dio/dio.dart';

import '../core/utilis/app_contances.dart';

class AuthenticationRepository {

  final Dio _dio = Dio();

  Future<String> signIn({required String phone, required String password}) async {
    try {
      final response = await _dio.post(AppContances.loginPath, data: {
        'phone': phone,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> registerNamePassword({required String name, required String password }) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'phone': name,
        'password': password,



      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> registerResetPassword({required String resetPassword }) async {
    try {
      final response = await _dio.post(AppContances.restPasswordPath, data: {
        'password': resetPassword,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> registerLocation({required String country, required String city , required String state}) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'country': country,
        'city': city,
        'state': state,

      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> registerGenderAndImageProfile({required String gender , required String imageProfile}) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'gender': gender,
        'profile_image': imageProfile,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> registerProfileImage({required String profileImage}) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'profile_image': profileImage,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> registerIdImages({required String nationalIdFrontImage,required String nationalIdBackImage}) async {
    try {
      final response = await _dio.post(AppContances.registerPath, data: {
        'national_id_front_image': nationalIdFrontImage,
        'national_id_back_image': nationalIdBackImage,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> generateOTP({required String phone}) async {
    try {
      final response = await _dio.post(AppContances.generateOtpCodePath, data: {
        'phone': phone,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
  Future<String> checkOTP({required String otp}) async {
    try {
      final response = await _dio.post(AppContances.checkOtpCodePath, data: {
        'otp_code': otp,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
}
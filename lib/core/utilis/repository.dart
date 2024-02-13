import 'package:dio/dio.dart';

import 'app_contances.dart';


class AuthenticationRepository {

  final Dio _dio = Dio();

  Future<String> signIn({required String phone, required String password}) async {
    try {
      final response = await _dio.post(AppConstances.loginPath, data: {
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
      final response = await _dio.post(AppConstances.registerPath, data: {
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
      final response = await _dio.post(AppConstances.restPasswordPath, data: {
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
      final response = await _dio.post(AppConstances.registerPath, data: {
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
      final response = await _dio.post(AppConstances.registerPath, data: {
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
      final response = await _dio.post(AppConstances.registerPath, data: {
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
      final response = await _dio.post(AppConstances.registerPath, data: {
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
      final response = await _dio.post(AppConstances.generateOtpCodePath, data: {
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
      final response = await _dio.post(AppConstances.checkOtpCodePath, data: {
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
//Profile Repository
class ProfileRepository {
  final Dio _dio = Dio();
  Future <Map <String , dynamic>> fetchProfile() async {
    try {
      final response = await _dio.get('${AppConstances.profilePath}/get');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch profile');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }


  }
  Future<void> updateProfile  (Map <String , dynamic> updatedData) async {
    try {
      await _dio.post('${AppConstances.updateProfilePath}/get' , data:updatedData);
    } catch (error) {
      throw Exception('An error occurred: $error');
    }


  }
  Future<void> deleteProfile  () async {
    try {
      await _dio.post('${AppConstances.deleteProfilePath}/get');
    } catch (error) {
      throw Exception('An error occurred: $error');
    }


  }




}
//Founded Post Repository
class FoundedPostRepository
{
  final Dio _dio = Dio();
  Future<void> createFoundPost(Map <String, dynamic> postData) async {
    try {
      await _dio.post(AppConstances.foundedPostPath, data: postData);
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
}

//Lost post Repository
class LostPostRepository
{
  final Dio _dio = Dio();
  Future <void> createLostPost (Map <String , dynamic> postData)async
  {
    try {
      await _dio.post(AppConstances.missingPostPath , data: postData);
    }catch (error)
    {
      throw Exception('An error occurred : $error');
    }
  }
}
//Founded Person Repository
class FoundedPersonsDataRepository
{
  final Dio _dio = Dio ();
  Future <List <Map <String , dynamic>>> fetchFoundedPersons () async
  {
    try
    {
      final response = await _dio.get(AppConstances.foundedPersonDataPath);
      return List<Map <String, dynamic>>.from(response.data['data']);

    }catch (e)
    {
      throw Exception('Failed to load founded persons: $e');
    }
  }

  Future<void> updateFoundedPerson(int personId, Map<String, dynamic> updatedData) async {
    try {
      await _dio.put('${AppConstances.updateFoundedPersonPath}/$personId', data: updatedData);
    } catch (e) {
      throw Exception('Failed to update founded person: $e');
    }
  }

  Future<void> deleteFoundedPerson(int personId) async {
    try {
      await _dio.put('${AppConstances.deleteFoundedPersonPath}/$personId',);
    } catch (e) {
      throw Exception('Failed to delete founded person: $e');
    }
  }


}

//Lost Persons Repository
class LostPersonsDataRepository
{
final Dio _dio = Dio ();
Future <List <Map <String , dynamic>>> fetchLostPersons () async
{
  try
  {
    final response = await _dio.get(AppConstances.lostPersonDataPath);
    return List<Map <String, dynamic>>.from(response.data['data']);

  }catch (e)
  {
    throw Exception('Failed to load lost persons: $e');
  }
}

Future<void> updateLostPerson(int personId, Map<String, dynamic> updatedData) async {
  try {
    await _dio.put('${AppConstances.updateLostPersonPath}/$personId', data: updatedData);
  } catch (e) {
    throw Exception('Failed to update lost person: $e');
  }
}

Future<void> deleteLostPerson(int personId) async {
  try {
    await _dio.put('${AppConstances.deleteLostPersonPath}/$personId',);
  } catch (e) {
    throw Exception('Failed to delete lost person: $e');
  }
}


}


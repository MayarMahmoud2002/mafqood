import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';
import '../../users_bloc/user_data/user_data.dart';
import 'app_contances.dart';


class AuthenticationRepository {

 static Dio _dio = Dio();
  init () {
    _dio = Dio(
        BaseOptions(
          baseUrl:AppConstances.baseUrl,
          receiveDataWhenStatusError: true,
        )
    );
  }

  Future<String> signIn({required String phone, required String password}) async {
    try {
      final response = await _dio.post(AppConstances.loginPath, data: {
        'phone': phone,
        'password': password,
      });
      if (response.statusCode == 200) {
        print (response.data);
        return response.data['token'];
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      rethrow;
    }
  }
   registerNamePassword({required String name, required String password }) async {
    try {
      await DeskStorage().setNameAndPasswordRegistered(name, password);
    } catch (error) {
      rethrow;
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
      rethrow;
    }
  }
  registerLocation({required String country, required String city , required String state}) async {
    try {
      await DeskStorage().setLocationRegister(country,state,city);
    } catch (error) {
      rethrow;
    }
  }
   registerGenderAndImageProfile({required String gender , required String imageProfile}) async {
    try {
     await DeskStorage().setGenderAndImageRegister(gender, imageProfile);
    } catch (error) {
      rethrow;
    }
  }
 Future<Uint8List> imageFileToUint8List(String filePath) async {
   // Read the image file as bytes
   final File imageFile = File(filePath);
   final Uint8List imageBytes = await imageFile.readAsBytes();
   return imageBytes;
 }
  registerIdImages({required String nationalIdFrontImage,required String nationalIdBackImage}) async {
    try {
      await DeskStorage().setIdImagesRegister(nationalIdFrontImage, nationalIdBackImage);
    } catch (error) {
      rethrow;
    }
  }
 register({required String phone})async {
    try {
      await DeskStorage().getRegisterData().then ((value) async {
        RegisterData registerData = value;

        List<int> compressedProfileImageBytes = await FlutterImageCompress.compressWithList(
         await imageFileToUint8List(registerData.imageProfile!),
          minHeight: 1024,
          minWidth: 1024,
          quality: 50,
        );
        List<int> compressedFrontIdImageBytes = await FlutterImageCompress.compressWithList(
          await imageFileToUint8List(registerData.nationalIdFrontImage!),
          minHeight: 1024,
          minWidth: 1024,
          quality: 50,
        );
        List<int> compressedBackIdImageBytes = await FlutterImageCompress.compressWithList(
          await imageFileToUint8List(registerData.nationalIdBackImage!),
          minHeight: 1024,
          minWidth: 1024,
          quality: 50,
        );

        var formData = FormData.fromMap({
          'phone': phone,
          'name': registerData.name,
          'password': registerData.password,
          'country': registerData.country,
          'state': registerData.state,
          'city': registerData.city,
          'gender': registerData.gender,
          'profile_image': await MultipartFile.fromBytes(compressedProfileImageBytes, filename: 'compressedProfileImageBytes_${registerData.name}.png'),
          'national_id_front_image': await MultipartFile.fromBytes(compressedFrontIdImageBytes, filename: 'compressedFrontIdImageBytes_${registerData.name}.png'),
          'national_id_back_image': await MultipartFile.fromBytes(compressedBackIdImageBytes, filename: 'compressedBackIdImageBytes_${registerData.name}.png'),
        });
        final response = await _dio.post(AppConstances.registerPath,
            data: formData
           );

        if (response.statusCode == 200) {
          if (response.data['status'] != 200) {
            throw Exception(response.data['error']);
          } else {
            return response.data;
          }
        } else {
          throw Exception(response.data['error']);
        }
      });

    } catch (error) {
      rethrow;
    }

 }
  Future<String> generateOTP({required String phone}) async {
    try {
      final response = await _dio.post(AppConstances.generateOtpCodePath, data: {
        'phone': phone,
      });
      print (response.data);
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']['phone']);
        } else {
          return response.data['message'];
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      rethrow;
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
rethrow;
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
      rethrow;
    }


  }
  Future<void> updateProfile  (Map <String , dynamic> updatedData) async {
    try {
      await _dio.post('${AppConstances.updateProfilePath}/get' , data:updatedData);
    } catch (error) {
      rethrow;
    }


  }
  Future<void> deleteProfile  () async {
    try {
      await _dio.post('${AppConstances.deleteProfilePath}/get');
    } catch (error) {
      rethrow;
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
  Future<void> updateFoundedPerson(int personId, Map<String, dynamic> updatedData) async {
    try {
      await _dio.put('${AppConstances.updateFoundedPersonPath}/$personId', data: updatedData);
    } catch (e) {
      throw Exception('Failed to update founded person: $e');
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
  Future<void> updateLostPerson(int personId, Map<String, dynamic> updatedData) async {
    try {
      await _dio.put('${AppConstances.updateLostPersonPath}/$personId', data: updatedData);
    } catch (e) {
      throw Exception('Failed to update lost person: $e');
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

  // Future<void> updateFoundedPerson(int personId, Map<String, dynamic> updatedData) async {
  //   try {
  //     await _dio.put('${AppConstances.updateFoundedPersonPath}/$personId', data: updatedData);
  //   } catch (e) {
  //     throw Exception('Failed to update founded person: $e');
  //   }
  // }

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
//users data Repository
class UsersDataRepository {
  final Dio _dio = Dio();

  Future<List<UserData>> fetchUsers() async {
    try {
      final response = await _dio.get(AppConstances.getAllUsersPath);
      final List<dynamic> usersDataJson = response.data['data'];
      final List<UserData> usersData = usersDataJson.map((userDataJson) {
        return UserData(
          user: User(
            name: userDataJson['user']['name'],
            phone: userDataJson['user']['phone'],
            gender: userDataJson['user']['gender'],
            profileImage: userDataJson['user']['profile_image'],
          ),
          missingPeople: (userDataJson['missing_people'] as List<dynamic>).map((missingPersonJson) {
            return MissingPerson(
              id: missingPersonJson['id'],
              name: missingPersonJson['name'],
              gender: missingPersonJson['gender'],
              description: missingPersonJson['description'],
              country: missingPersonJson['country'],
              state: missingPersonJson['state'],
              city: missingPersonJson['city'],
              lostedAt: missingPersonJson['losted_at'],
              image: missingPersonJson['image'],
            );
          }).toList(),
          foundedPeople: (userDataJson['founded_people'] as List<dynamic>).map((foundedPersonJson) {
            return FoundedPerson(
              id: foundedPersonJson['id'],
              name: foundedPersonJson['name'],
              gender: foundedPersonJson['gender'],
              description: foundedPersonJson['description'],
              country: foundedPersonJson['country'],
              state: foundedPersonJson['state'],
              city: foundedPersonJson['city'],
              policeStation: foundedPersonJson['police_station'],
              foundedAt: foundedPersonJson['founded_at'],
              image: foundedPersonJson['image'],
            );
          }).toList(),
        );
      }).toList();

      return usersData;
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}


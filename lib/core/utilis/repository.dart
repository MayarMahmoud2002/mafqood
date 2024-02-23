import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mafqood/classes/post_model.dart';
import 'package:mafqood/core/shared_widgets/flush_bar.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';
import 'package:mafqood/core/utilis/shared_methods.dart';
import '../../classes/new_post_model.dart';
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
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']);
        } else {
          DeskStorage().setAuthenticatedData(
              phone, response.data['data']['access_token'], 1, phone, 'user');
          return response.data["data"]['access_token'];
        }
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
          if (response.data['status'] != "200") {
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
      print (phone);
      print (response.data);
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']);
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
      // final response = await _dio.post(AppConstances.checkOtpCodePath, data: {
      //   'otp_code': otp,
      // });
      // if (response.statusCode == 200) {
      //   return response.data['token'];
      // } else {
      //   throw Exception('Authentication failed');
      // }
      if (otp == "1234") {
        return "1234";
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
rethrow;
    }
  }

  updatePassword({required String phone, required String newPassword}) async{
    try {
      final response = await _dio.post(AppConstances.restPasswordPath, data: {
        'phone': phone,
        'password': newPassword,
      });
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']);
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
class PersonsRepository
{
  static Dio _dio = Dio();
  init () {
    _dio = Dio(
        BaseOptions(
          baseUrl:AppConstances.baseUrl,
          receiveDataWhenStatusError: true,
        )
    );
  }
  getFoundedPersons() async {
    try {
      var token= await DeskStorage().getToken();
      final response = await _dio.get(AppConstances.foundedPersonDataPath,options: Options(
        headers: { 'Authorization': 'Bearer $token',
         "Content-Type": "application/json",
        },
        validateStatus: (status) => true,

      ));
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']);
        } else {
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print ("error in getFoundedPersons");
      rethrow;
    }
  }
  getMissingPersons()async {
    try {
      var token= await DeskStorage().getToken();
      final response = await _dio.get(AppConstances.lostPersonDataPath,options: Options(
        headers: { 'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
        validateStatus: (status) => true,

      ));
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']);
        } else {
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print ("error in getMissingPersons");
      rethrow;
    }
  }

  deleteFoundedPerson(int i,PersonType personType) async{
    String path = personType == PersonType.foundedPerson ? AppConstances.deleteFoundedPersonPath : AppConstances.deleteLostPersonPath;
    path += "/$i";
    try {
      var token= await DeskStorage().getToken();
      final response = await _dio.post(path,options: Options(
        headers: { 'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
        validateStatus: (status) => true,
      ));
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']);
        } else {
          showFlushBar(response.data['message'],isError: false);
          print (response.data);
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print ("delete in getFoundedPersons");
      rethrow;
    }
  }



  addFoundedOrMissingPerson(NewPostModel postModel,PersonType personType)async {
    String path = personType == PersonType.foundedPerson ? AppConstances.foundedPostPath : AppConstances.missingPostPath;
    try {
      List<int> compressedImageBytes = await FlutterImageCompress.compressWithList(
        await imageFileToUint8List(postModel.image!),
        minHeight: 1024,
        minWidth: 1024,
        quality: 50,
      );
      FormData formData = FormData.fromMap({
        "name": postModel.name,
        "country": postModel.country,
        "city": postModel.city,
        "state": postModel.state,
        "gender":postModel.gender,
        'description' : postModel.description,
        if (personType == PersonType.foundedPerson) 'founded_at' : postModel.date,
        if (personType == PersonType.missingPerson) 'losted_at' : postModel.date,
        if (personType == PersonType.foundedPerson)'police_station' : postModel.policeStation,
        'image' :await MultipartFile.fromBytes(compressedImageBytes, filename: 'compressedImageBytes_${postModel.name}.png'),

      });
      var token= await DeskStorage().getToken();
      final response = await _dio.post(path,
          data: formData,
          options: Options(
        headers: { 'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
        validateStatus: (status) => true,
      ));
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          throw Exception( response.data['error']);
        } else {
          showFlushBar(response.data['message'],isError: false);
          print (response.data);
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print ("error in addFoundedPersons");
      rethrow;
    }

  }


}




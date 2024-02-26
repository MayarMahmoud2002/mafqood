import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mafqood/classes/post_model.dart';
import 'package:mafqood/core/shared_widgets/flush_bar.dart';
import 'package:mafqood/core/utilis/desk_storage.dart';
import 'package:mafqood/core/utilis/shared_methods.dart';
import 'package:mafqood/splash_screen/presentation/views/screens/splash_screen.dart';
import '../../classes/new_post_model.dart';
import 'app_contances.dart';
import 'navigation_service.dart';


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
  static Dio _dio = Dio();

  init() {
    _dio = Dio(
        BaseOptions(
          baseUrl: AppConstances.baseUrl,
          receiveDataWhenStatusError: true,
        )
    );
  }

  Future <Map <String, dynamic>> fetchProfile() async {
    try {
      var token = await DeskStorage().getToken();
      final response = await _dio.get(
          AppConstances.profilePath, options: Options(
        headers: { 'Authorization': 'Bearer $token',
          "Content-Type": "application/json",
        },
        validateStatus: (status) => true,

      ));
      if (response.statusCode == 200) {
        if (response.data['status'] != 200) {
          throw Exception(response.data['error']);
        } else {
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print (error);
      print("error in getProfile");
      rethrow;
    }
  }

  Future<void> updateProfile({
    String? name,
    String? country,
    String? state,
    String? city,
    String? gender,
    String? imgPath}) async {
    try {
      List<int> compressedImageBytes = [];
      if (imgPath != null)
        compressedImageBytes = await FlutterImageCompress.compressWithList(
          await imageFileToUint8List(imgPath),
          minHeight: 1024,
          minWidth: 1024,
          quality: 50,
        );
      FormData formData = FormData.fromMap({
     if(name!=null&&name.isNotEmpty)   "name": name,
      if(country!=null&&country.isNotEmpty) "country": country,
      if(city!=null&&city.isNotEmpty) "city": city,
      if(state!=null&&state.isNotEmpty) "state": state,
      if(gender!=null&&gender.isNotEmpty) "gender": gender,
      if(imgPath!=null&& imgPath.isNotEmpty) 'profile_image': await MultipartFile.fromBytes(
            compressedImageBytes, filename: 'compressedImageBytes_${name}.png'),

      });
      print(formData.length);
      for (var key in formData.fields) {
        print(key.key);
        print(key.value);
      }
      var token = await DeskStorage().getToken();
      final response = await _dio.post(AppConstances.updateProfilePath,
          data: formData,
          options: Options(
            headers: { 'Authorization': 'Bearer $token',
              "Content-Type": "application/json",
            },
            validateStatus: (status) => true,
          ));
      print(response.data);
      if (response.statusCode == 200) {
        if (response.data['status'] != 200) {
          if (response.data['message'] == "validation error")
            throw Exception(response.data['error']);
          else
            throw Exception(response.data['message']);
        } else {
          print(response.data);
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print(error);
      print("error in addFoundedPersons");
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
      print (response.data);
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          if (response.data['message']=="validation error")
            throw Exception( response.data['error']);
          else
            throw Exception( response.data['message']);
        } else {
          print (response.data);
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print (error);
      print ("error in addFoundedPersons");
      rethrow;
    }

  }

  updateFoundedOrMissingPerson(NewPostModel postModel, PersonType personType,int id)async {
    String path = personType == PersonType.foundedPerson ? AppConstances.updateFoundedPersonPath : AppConstances.updateLostPersonPath;
    try {
      List<int> compressedImageBytes=[];
      if (postModel.image!=null&&postModel.image!="" ) {
        compressedImageBytes  = await FlutterImageCompress.compressWithList(
          await imageFileToUint8List(postModel.image!),
          minHeight: 1024,
          minWidth: 1024,
          quality: 50,
        );
      }
      print ("-------------------------");


      FormData formData = FormData.fromMap({
        if (postModel.name!=null)   "name": postModel.name,
        if (postModel.country!=null)   "country": postModel.country,
        if (postModel.city!=null)   "city": postModel.city,
        if (postModel.state!=null)   "state": postModel.state,
        if (postModel.gender!=null)   "gender":postModel.gender,
        if (postModel.description!=null)   'description' : postModel.description,
        if (postModel.date!=null)    if (personType == PersonType.foundedPerson) 'founded_at' : postModel.date,
        if (postModel.date!=null)    if (personType == PersonType.missingPerson) 'losted_at' : postModel.date,
        if (postModel.policeStation!=null)    if (personType == PersonType.foundedPerson)'police_station' : postModel.policeStation,
        if (postModel.image!=null)    if (postModel.image!="") 'image' :await MultipartFile.fromBytes(compressedImageBytes, filename: 'compressedImageBytes_${postModel.name}.png'),
        'id' : id,

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
      print (response.data);
      if (response.statusCode == 200) {
        if (response.data['status'] !=200) {
          if (response.data['message']=="validation error")
            throw Exception( response.data['error']);
          else
            throw Exception( response.data['message']);
        } else {
          print (response.data);
          return response.data;
        }
      } else {
        throw Exception('Authentication failed');
      }
    } catch (error) {
      print (error);
      print ("error in update Persons");
      rethrow;
    }
  }


}




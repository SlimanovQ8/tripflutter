import 'dart:io';

import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trips_project/models/userProfile.dart';

import '../models/user.dart';
import '../providers/auth_providers.dart';

class AuthServices {
 final Dio _dio = Dio();

  final _baseUrl = 'http://10.0.2.2:8000';
  final test = 'https://c91d-37-231-212-62.eu.ngrok.io';
  Future<String> signup({required User user}) async {
     String token = "";
    try {
      Response response =
      await _dio.post(_baseUrl + '/register/', data: user.toJson());
      //token = response.data["access"];

      print(response.data);
    } on DioError catch (error) {
      token = "ok";
      print(error);
    }
    return token;
  }
  Future<String> signin({required User user}) async {
    String token = "";
    try {
      Response response = await _dio.post(_baseUrl + '/login/', data: {"username": user.username, "password": user.password},
      );

      token = response.data["access"];
      token = response.data["access"];
      print("DC ${user.username}");

      print(" za ${response.data["username"]}");
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

 Future<List<User>> getUsers(int id) async {
   List<User> users = [];
   try {
     Response response = await _dio.get(_baseUrl + '/users-list/');
     users =
         (response.data as List).map((user) => User.fromJson(user)).where((element) =>  element.id == id).toList();
     for(int i = 0; i < users.length; i ++ )
       {
         print(users[i].id) ;
      }
   } on DioError catch (error) {
     print(error);
   }
   return users;
 }

 Future<List<UserProfile>> getUsserInfo(int id) async {
   List<UserProfile> users = [];
   try {
     Response response = await _dio.get(_baseUrl + '/user-profile/${id}');
     users =
         (response.data as List).map((user) => UserProfile.fromJson(user)).toList();
     for(int i = 0; i < users.length; i ++ )
     {
       print(users[i].id) ;
     }
   } on DioError catch (error) {
     print(error);
   }
   return users;
 }
  Future <UserProfile> getUserProfileServices(int id) async {
    List <UserProfile> profile = [];
    try {
      Response response = await _dio.get(_baseUrl + '/users-profile/${id}/');
      print(response.data);
      return UserProfile.fromJson(response.data);



      profile =
          (response.data as List).map((profile1) => UserProfile.fromJson(profile1)).toList();
      print(profile);
    } on DioError catch (error) {
      print(error);
    }
    throw Exception("Failed to Load Detail Restaurant, Please Check Your Internet");
  }
 Future<bool> UpdateProfile({ required int UserID, required String Bio, required File image}) async {
   String token = await AuthProvider().getToken();
   print(token);
   bool check = false;

   try {


     FormData data = FormData.fromMap({
       "bio": Bio,

       "image": await MultipartFile.fromFile(image.path),
     });
     _dio.options.headers["Authorization"] = "Bearer ${token}";

     Response response = await _dio.put( _baseUrl + '/users/${UserID}/update/',

         data: data);
     check = true;



   } on DioError catch (error) {
     print(error);
   }
   return check;
 }
}


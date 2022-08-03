import 'package:dio/dio.dart';

import '../models/user.dart';

class AuthServices {
  final Dio _dio = Dio();

  final _baseUrl = 'http://10.0.2.2:8000';
  Future<String> signup({required User user}) async {
    late String token;
    try {
      Response response =
      await _dio.post(_baseUrl + '/register/', data: user.toJson());
      token = response.data["access"];
    } on DioError catch (error) {
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


}


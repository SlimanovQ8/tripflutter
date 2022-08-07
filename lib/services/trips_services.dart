import 'dart:io';

import 'package:trips_project/models/trip.dart';
import 'package:dio/dio.dart';
import 'package:trips_project/providers/auth_providers.dart';

class TripsServices {
  final Dio _dio = Dio();

  final _baseUrl = 'http://8f22-188-71-240-74.in.ngrok.io';
  final _testURL = 'http://10.0.2.2:8000';

  Future<List<Trip>> getTripsServices() async {
    List<Trip> trips = [];

    try {
      Response response = await _dio.get(_testURL + '/trips-list');
      trips =
          (response.data as List).map((trip) => Trip.fromJson(trip)).toList();
      print(trips[0].image);
    } on DioError catch (error) {
      print(error);
    }
    return trips;
  }


  Future<List<Trip>> getUserTripsServices({ required int UserID}) async {
    List<Trip> trips = [];
    try {
      Response response = await _dio.get(_testURL + '/trips-list/${UserID}');
      trips =
          (response.data as List).map((trip) => Trip.fromJson(trip)).toList();
      print(trips[0].image);
    } on DioError catch (error) {
      print(error);
    }
    return trips;
  }
  Future<bool> CreateTrip({required String title , required String description, required File image}) async {
     String token = await AuthProvider().getToken();
     print(token);
    bool check = false;

    try {


      FormData data = FormData.fromMap({
        "title": title,
        "description": description,

        "image": await MultipartFile.fromFile(image.path),
        "usernake": "username",

      });
      _dio.options.headers["Authorization"] = "Bearer ${token}";

      Response response = await _dio.post( _testURL + '/trips/create/',

          data: data);
      check = true;



      //token = response.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return check;
  }

  Future<bool> UpdateTrip({ required int TripID,required String title , required String description, required File image}) async {
    String token = await AuthProvider().getToken();
    print(token);
    bool check = false;

    try {


      FormData data = FormData.fromMap({
        "title": title,
        "description": description,

        "image": await MultipartFile.fromFile(image.path),
      });
      _dio.options.headers["Authorization"] = "Bearer ${token}";

      Response response = await _dio.put( _testURL + '/trips/${TripID}/update/',

          data: data);
      check = true;



    } on DioError catch (error) {
      print(error);
    }
    return check;
  }

  Future<bool> DeleteTrip({ required int TripID}) async {
    String token = await AuthProvider().getToken();
    print(token);
    bool check = false;

    try {


      _dio.options.headers["Authorization"] = "Bearer ${token}";

      Response response = await _dio.delete( _testURL + '/trips/${TripID}/delete/');
      check = true;



    } on DioError catch (error) {
      print(error);
    }
    return check;
  }

  Future<bool> getUserTrip({ required int UserID}) async {
    String token = await AuthProvider().getToken();
    print(token);
    bool check = false;

    try {

      Response response = await _dio.get(_testURL + '/trips-list/${UserID}/');
      check = true;



    } on DioError catch (error) {
      print(error);
    }
    return check;
  }
}


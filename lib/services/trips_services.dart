import 'dart:io';

import 'package:trips_project/models/trip.dart';
import 'package:dio/dio.dart';
import 'package:trips_project/providers/auth_providers.dart';

class TripsServices {
  final Dio _dio = Dio();

  final _baseUrl = 'http://8f22-188-71-240-74.in.ngrok.io';

  Future<List<Trip>> getTripsServices() async {
    List<Trip> trips = [];
    try {
      Response response = await _dio.get(_baseUrl + '/trips-list');
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
      });
      _dio.options.headers["Authorization"] = "Bearer ${token}";

      Response response = await _dio.post( _baseUrl + '/trips/create/',

          data: data);
      check = true;



      //token = response.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return check;
  }
}
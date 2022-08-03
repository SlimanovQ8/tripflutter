import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:trips_project/models/trip.dart';
import 'package:trips_project/services/trips_services.dart';

class TripsProvider extends ChangeNotifier {
  List<Trip> trips = [];

  bool check = false;
  Future<void> getTrips() async {
    trips = await TripsServices().getTripsServices();
  }
  Future<bool?> CreateTrip(String title, String description, File image) async {

    check = await TripsServices().CreateTrip(title: title, description: description, image: image);

    notifyListeners();

    return check;
  }
}
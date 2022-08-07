import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:trips_project/models/trip.dart';
import 'package:trips_project/services/trips_services.dart';

class TripsProvider extends ChangeNotifier {
  List<Trip> trips = [];
  List<Trip> userTrips = [];

  bool check = false;
  Future<void> getTrips() async {
    trips = await TripsServices().getTripsServices();
  }

  Future<void> getUserTrips({required int UserID}) async {
    userTrips = await TripsServices().getUserTripsServices(UserID: UserID);
  }
  Future<bool?> CreateTrip(String title, String description, File image) async {

    check = await TripsServices().CreateTrip(title: title, description: description, image: image);
    await getTrips();


    notifyListeners();

    return check;
  }

  Future<bool?> UpdateTrip(int TripID, String title, String description, File image) async {

    check = await TripsServices().UpdateTrip(TripID: TripID, title: title, description: description, image: image);
    await getTrips();
    notifyListeners();

    return check;
  }

  Future<bool?> DeleteTrip(int TripID) async {

    check = await TripsServices().DeleteTrip(TripID: TripID);
    await getTrips();
    notifyListeners();

    return check;
  }
}
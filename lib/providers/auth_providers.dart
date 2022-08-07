import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trips_project/models/userProfile.dart';

import '../models/user.dart';
import '../services/auth_services.dart';


class AuthProvider extends ChangeNotifier {
  String token = "";
   late User user;
  late UserProfile profile;
  List <UserProfile> getUseProfile = [];
   bool isSignedIn = false;
   List <User> users = [];

  Future <void> getUsers(int id) async {
    users = await AuthServices().getUsers(id);
  }
  Future <void> getUserProfile(int id) async {
    getUseProfile = await AuthServices().getUsserInfo(id);
  }
  Future <bool> signup({required User user}) async {
    token = await AuthServices().signup(user: user);


        isSignedIn = await signin(user: user);



    if(isSignedIn)
      return true;
    else
      return false;
  }

  Future <bool> signin({required User user}) async {
    token = await AuthServices().signin(user: user);
    if(token.length > 2) {
      print("d ${token}");
      setToken(token);


      this.user = await User.fromJson(Jwt.parseJwt(token));
      profile = await AuthServices().getUserProfileServices(this.user.userID!);

      //print(this.user!.username!);
      notifyListeners();
      return true;
    }
    return false;

  }
  Future<bool?> UpdateProfile(int UserID, String Bio, File image) async {

    bool check = await AuthServices().UpdateProfile(UserID: UserID, Bio: Bio, image: image);
    profile = await AuthServices().getUserProfileServices(this.user.userID!);

    notifyListeners();

    return check;
  }
  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = await prefs.setString('access', token);
    print(x);
  }


  Future <String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('access') ?? "";

    return token;

    notifyListeners();
  }
  Future<void> getProfile(int id) async {
     profile = await AuthServices().getUserProfileServices(id);
  }

}
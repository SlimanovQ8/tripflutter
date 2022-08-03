import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/auth_services.dart';


class AuthProvider extends ChangeNotifier {
  String token = "";
   late User user;
  void signup({required User user}) async {
    token = await AuthServices().signup(user: user);
    setToken(token);
    print(token);
  }

  Future <bool> signin({required User user}) async {
    token = await AuthServices().signin(user: user);
    if(token.length > 2) {
      print("d ${token}");
      setToken(token);


      this.user = await User.fromJson(Jwt.parseJwt(token));

      //print(this.user!.username!);
      notifyListeners();
      return true;
    }
    return false;

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

}
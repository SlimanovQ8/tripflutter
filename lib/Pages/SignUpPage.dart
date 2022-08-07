import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/auth_providers.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  String name = "";
  String username = "";
  String email = "";
  String password = "";
  bool _isLoading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: Container(
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFFF17B00),
                      Colors.orange,
                      Color(0XFFF17B00),

                    ],
                  ),
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(90))),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 40,
                    left: 120,
                    child: ImageIcon(
                      AssetImage("assets/images/traveling.png"),
                      color: Colors.white,
                      size: 150,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 30,

                    child: Text("Register", style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),)
                  ),
                ],
              ),
            ),
      Container(
        //color: Colors.red,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 62),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person,
                      color: Color.fromRGBO(240, 123, 63, 1)),
                  hintText: 'Name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),

            ),


            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),

              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.mail,
                      color: Color.fromRGBO(240, 123, 63, 1)),
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),

              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.person,
                      color: Color.fromRGBO(240, 123, 63, 1)),
                  hintText: 'Username',
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45,
              margin: EdgeInsets.only(top: 20),
              padding:
              EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2)
                  ]),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key,
                      color: Color.fromRGBO(240, 123, 63, 1)
                  ),
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
            ),
    ]
        ),
      ),
            Container(
              width:  MediaQuery.of(context).size.width * 0.3 ,
              height: 45,
              margin: EdgeInsets.all( 30),
              child: _isLoading ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xffee8200),
                ),
              ): ElevatedButton(
                child: Text("Register",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),

                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffee8200),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),

                onPressed: () {
                  print(name);
                  print(email);
                  print(username);
                  print(password);
                  SignUp(name, email, username, password);

                },
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account ?"),
                  InkWell(
                    child: Text(
                      " Sign In",
                      style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                    ),
                    onTap: () {
                       context.push("/signin");
                    },
                  ),
                ],
              

            ),

          ],
        ),
      ),
    );
  }
  void SignUp(String name, String email, String username, String password, ) async {
    print("j");
    bool? chk;

    setState(() {
      _isLoading = true;

    });
    chk = await Provider.of<AuthProvider>(context, listen: false).signup(user: User(
      first_name: name,
      email: email,
      username: username,
      password: password,
    ));
    print(chk);
    if (chk)
      {
        context.push("/homepage");
        setState(() {
          _isLoading = false;
        });

     }
    else {
      _isLoading = false;
      }


  }
}

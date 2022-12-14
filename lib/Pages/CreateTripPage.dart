import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_project/providers/trips_provider.dart';

import '../models/user.dart';
import '../providers/auth_providers.dart';
import 'package:image_picker/image_picker.dart';
class CreateTripPage extends StatefulWidget {
  const CreateTripPage({Key? key}) : super(key: key);

  @override
  _CreateTripPageState createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  @override
  String title = "";
  String description = "";
  String image = "";
  bool chk = false;
  bool isLoading = false;
  File? _image;
  Widget build(BuildContext context) {
    final _picker = ImagePicker();

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

                      child: Text("Create Trip", style: TextStyle(
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
                          icon: Icon(Icons.title,
                              color: Color.fromRGBO(240, 123, 63, 1)),
                          hintText: 'Title',
                        ),
                        onChanged: (value) {
                          setState(() {
                            title = value;
                          });
                        },
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.only(top: 20),
                      padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2)
                          ]),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.description,
                              color: Color.fromRGBO(240, 123, 63, 1)
                          ),
                          hintText: 'description',
                        ),
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                    ),
                  ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final XFile? image = await _picker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      _image = File(image!.path);

                      chk = true;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(45, 64, 89, 1)),
                    child: chk == true
                        ? Image.file(
                      _image!,
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.fitHeight,
                    )
                        : Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(45, 64, 89, 1)),
                      width: 200,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        color: Color.fromRGBO(240, 123, 63, 1),
                      ),
                    ),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Text("Image"),
                // )
              ],
            ),
            Container(
              width:  MediaQuery.of(context).size.width * 0.3 ,
              height: 45,
              margin: EdgeInsets.all( 30),
              child: isLoading ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xffee8200) ,
                ),
              ) :ElevatedButton(
                child: Text("Create",
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

                  CreateTrip(title, description, _image!);


                },
              ),
            ),


          ],
        ),
      ),
    );
  }
  void CreateTrip(String title, String description, File img) async {
    print("j");
    setState(() {
      isLoading = true;

    });
    bool? chk;

    chk = await Provider.of<TripsProvider>(context, listen: false)
        .CreateTrip(title, description, img);

    if (chk!) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                title: Text(
                  "Trip Created",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                content: Text(
                  "Your trip ${title} has been created successfully!",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        context.push("/homepage");
                      });
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Color.fromRGBO(240, 123, 63, 1)
                      ),
                    ),
                  ),

                ],
              ));
    }
    else {
      setState(() {
        isLoading = true;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                title: Text(
                  "Error",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                content: Text(
                  "There is an error occurred!",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        context.push("/homepage");
                      });
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Color.fromRGBO(240, 123, 63, 1)
                      ),
                    ),
                  ),

                ],
              ));
  }
  }



  }


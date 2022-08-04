import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_project/models/trip.dart';
import 'package:trips_project/providers/trips_provider.dart';

import '../models/user.dart';
import '../providers/auth_providers.dart';
import 'package:image_picker/image_picker.dart';
class UpdateTripPage extends StatefulWidget {
  final Trip TripDetail;

  const UpdateTripPage({
    Key? key,
    required this.TripDetail
  }) : super(key: key);

  @override
  _CreateTripPageState createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<UpdateTripPage> {
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

                      child: Text("Update Trip", style: TextStyle(
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
                          hintText: widget.TripDetail.title,
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
                          hintText: widget.TripDetail.description,
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
              ) : ElevatedButton(
                child: Text("Update",
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

                  UpdateTrip(widget.TripDetail.user!, title, description, _image!);


                },
              ),
            ),

          ],
        ),
      ),
    );
  }
  void UpdateTrip(int TripID, String title, String description, File img) async {
    print("j");

    Provider.of<TripsProvider>(context, listen: false)
        .UpdateTrip(TripID, title, description, img);

    setState(() {
      //isLoading = false;
      context.push("/homepage");
    });
  }
}

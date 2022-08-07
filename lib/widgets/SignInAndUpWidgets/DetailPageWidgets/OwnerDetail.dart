import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_project/Pages/viewProfile.dart';

import 'package:trips_project/constants/constants.dart';
import 'package:trips_project/models/trip.dart';
import 'package:trips_project/models/user.dart';
import 'package:trips_project/providers/auth_providers.dart';

import '../../../providers/trips_provider.dart';

class OwnerDetail extends StatefulWidget {
  final User UserDetail;
  final Trip TripDetail;
    const OwnerDetail({
      Key? key,
      required this.UserDetail,
      required this.TripDetail,
  }) : super(key: key);

  @override
  _OwnerDetailState createState() => _OwnerDetailState();
}

class _OwnerDetailState extends State<OwnerDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double height = size.height;
    double width = size.width;

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      width: width,
      child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [



            FutureBuilder(
              future: Provider.of<AuthProvider>(context, listen: false).getUsers(widget.TripDetail.user!),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Text(""
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    print(dataSnapshot.error);

                    return const Center(
                      child: Text('Ther'),
                    );
                  } else {
                    return Consumer<AuthProvider>(
                        builder: (context, auth, child) =>


                                    FutureBuilder(
                                      future: Provider.of<AuthProvider>(context, listen: false).getUserProfile(widget.TripDetail.user!),
                                      builder: (context, dataSnapshot) {
                                        if (dataSnapshot.connectionState == ConnectionState.waiting) {
                                          return const Text(""
                                          );
                                        } else {
                                          if (dataSnapshot.error != null) {
                                            print(dataSnapshot.error);

                                            return const Center(
                                              child: Text('Ther'),
                                            );
                                          } else {
                                            return Consumer<AuthProvider>(
                                              builder: (context, user, child) =>


                                                  Container(
                                                    child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(builder: (context) =>  ViewProfile(trip: widget.TripDetail, prof: user.getUseProfile[0], userr: widget.UserDetail)),
                                                          );
                                                        },
                                                      child: Row(
                                                        children: [
                                                          CircleAvatar(
                                                            backgroundImage: NetworkImage(user.getUseProfile[0].image!),
                                                          ),

                                                          Container(
                                                            //width: 100,
                                                              height: 40,
                                                              padding: EdgeInsets.only(left: 12),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [

                                                                  Text(auth.users[0].username!),
                                                                  Text("Owner ")
                                                                ],
                                                              )
                                                          ),
                                                        ],

                                                      ),
                                                    ),
                                                  )


                                            );
                                          }
                                        }
                                      },
                                    ),




                    );
                  }
                }
              },
            ),
            Row(
              children: [

                Container(

                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    child: Ink(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: secondaryBackground,
                          border: Border.all(
                              color: Colors.transparent,
                              width: 1
                          )
                      ),
                      child: widget.TripDetail.user != widget.UserDetail.userID
                          ? IconButton(
                        icon: Icon(Icons.message),
                        color: AppButtons,
                        //iconSize: 20,
                        onPressed: () {
                          DeleteTrip(widget.TripDetail.id!);
                        },
                      )
                          : IconButton(
                        icon: Icon(Icons.more_horiz),
                        color: AppButtons,
                        //iconSize: 20,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: new Icon(Icons.delete),
                                      title: new Text('Delete'),
                                      onTap: () {
                                        DeleteTrip(widget.TripDetail.id!);
                                      },
                                    ),
                                    ListTile(
                                      leading: new Icon(Icons.edit),
                                      title: new Text('Edit'),
                                      onTap: () {
                                        context.push("/updatetrip",
                                            extra: widget.TripDetail);
                                      },
                                    ),

                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ]
      ),
    );
  }

  void DeleteTrip(int TripID,) async {
    print("j");
    bool? chk;

    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text(
                "Are You sure?",
                style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
              ),
              content: Text(
                "Do you want to delete this trip?",
                style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                   chk =  await Provider.of<TripsProvider>(context, listen: false)
                        .DeleteTrip(TripID);

                    setState(() {
                      if (chk!)

                      context.push("/homepage");
                    });
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.grey),
                  onPressed: () {
                    setState(() {
                      context.pop();
                    });
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                  ),
                ),
              ],
            ));
  }
}

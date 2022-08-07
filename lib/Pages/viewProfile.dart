import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_project/models/userProfile.dart';
import 'package:trips_project/widgets/SignInAndUpWidgets/HomePageWidgets/PropertyView.dart';
import 'package:trips_project/widgets/SignInAndUpWidgets/ViewProfileWidgets/PropertyView.dart';

import '../models/trip.dart';
import '../models/user.dart';
import '../providers/trips_provider.dart';

class ViewProfile extends StatefulWidget {
  final Trip? trip;
  final UserProfile? prof;
  final User? userr;
  const ViewProfile({
    Key? key,
    required this.trip,
    required this.prof,
    required this.userr,
  }) : super(key: key);
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  bool pressGeoON = false;
  bool press = false;
  List <bool> isClicked = [false, false, false, false, false, false, false,  false, false, false, false, false, false, false, false, false, false, false, false];

  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
          children: [
            Container(

                child: GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 60 ),
                    height: 400.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                widget.prof!.image!,
                              ),
                              radius: 80.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            widget.userr!.username!,
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 15.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  UserTrips(id: widget.trip!.user!)),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            "Trips",
                                            style: TextStyle(
                                              color: Color(0xffee8200),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          FutureBuilder(
                                            future: Provider.of<TripsProvider>(context, listen: false).getUserTrips(UserID: widget.trip!.user!),
                                            builder: (context, dataSnapshot) {
                                              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                                                return const Center(
                                                  child: CircularProgressIndicator(),
                                                );
                                              } else {
                                                if (dataSnapshot.error != null) {
                                                  print(dataSnapshot.error);

                                                  return const Center(
                                                    child: Text('Ther'),
                                                  );
                                                } else {
                                                  return Consumer<TripsProvider>(
                                                    builder: (context, tripsProvider, child) => Container(
                                                    child: Text(
                                                      "${tripsProvider.userTrips.length}",
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ));

                                                }
                                              }
                                            },
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ),
            Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 100.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Bio",
                            style: TextStyle(
                              color: Color(0xffee8200),
                              fontStyle: FontStyle.normal,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(widget.prof!.bio!,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(
              height: 20.0,
            ),




          ],
        ),
      );

  }
}
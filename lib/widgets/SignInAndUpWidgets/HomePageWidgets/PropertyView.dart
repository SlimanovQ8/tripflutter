import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_project/providers/trips_provider.dart';

import '../../../Pages/HomePage.dart';

class PropertyViews extends StatefulWidget {
  const PropertyViews({Key? key}) : super(key: key);

  @override
  _PropertyViewsState createState() => _PropertyViewsState();
}

List <bool> isClicked = [false, false, false, false, false, false, false,  false, false, false, false, false, false, false, false, false, false, false, false];
class _PropertyViewsState extends State<PropertyViews> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,
      child: FutureBuilder(
        future: Provider.of<TripsProvider>(context, listen: false).getTrips(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return const Center(
                child: Text('An error occurred'),
              );
            } else {
              return Consumer<TripsProvider>(
                builder: (context, tripsProvider, child) => Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    itemCount: tripsProvider.trips.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.push("/DetailPage",
                              extra: tripsProvider.trips[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 15, top: 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.white,
                            ),
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        height: 180,
                                        width: width,
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(
                                            //"assets/images/trips.jpg"
                                            tripsProvider.trips[index].image!),
                                      ),
                                    ),
                                    Positioned(
                                      right: 30 / 2,
                                      top: 30 / 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(.5),
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        child: IconButton(
                                          icon: !isClicked[index]
                                              ? Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: Colors.black,
                                                )
                                              : Icon(
                                                  Icons.favorite_rounded,
                                                  color: Colors.redAccent,
                                                ),
                                          onPressed: () {
                                            setState(() {
                                              isClicked[index] =
                                                  !isClicked[index];
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 8, right: 30),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              tripsProvider.trips[index].title!,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 5),
                                            child: Text(
                                              "70 KD",
                                              //overflow: TextOverflow.ellipsis,

                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 8, bottom: 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.green,
                                      ),
                                      Text(
                                        ' 9/10  ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        ' (433 Reviews)  ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

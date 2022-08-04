import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trips_project/models/trip.dart';
import 'package:trips_project/providers/auth_providers.dart';

import '../widgets/SignInAndUpWidgets/DetailPageWidgets/ImageFlipperWidget.dart';
import '../widgets/SignInAndUpWidgets/DetailPageWidgets/OwnerDetail.dart';
import '../widgets/SignInAndUpWidgets/DetailPageWidgets/PropertyFeatures.dart';
import '../widgets/SignInAndUpWidgets/DetailPageWidgets/PropertyLocationMap.dart';
import '../widgets/SignInAndUpWidgets/DetailPageWidgets/bottomNavBarWidget.dart';

class DetailPage extends StatefulWidget {
  final Trip trip;
  const DetailPage({Key? key, required this.trip}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("Width: $width  height: $height");

    return Scaffold(
      key: scaffoldKey,
      //backgroundColor: FvColors.screen1Background,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                ImageFlipper(),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(

                        padding: EdgeInsets.only(bottom:8),
                        child: Text("title: ${widget.trip.id}", style: TextStyle(
                          fontSize: 20
                        ),),
                      ),
                      Container(
                        child: Text(
                          "Description: ${widget.trip.description}",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 4,
                  color: Color.fromARGB(255, 194, 194, 194),
                ),
                OwnerDetail(UserDetail: authProvider.user, TripDetail: widget.trip,),

              ],
            )),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(),
    );
  }
}

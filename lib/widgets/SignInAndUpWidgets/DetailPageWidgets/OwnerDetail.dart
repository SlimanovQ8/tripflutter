import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:trips_project/constants/constants.dart';

class OwnerDetail extends StatefulWidget {
  final int userID;
  final int tripOwner;
  final int tripID;
    const OwnerDetail({
      Key? key,
      required this.userID,
      required this.tripOwner,
      required this.tripID,
  }) : super(key: key);

  @override
  _OwnerDetailState createState() => _OwnerDetailState();
}

class _OwnerDetailState extends State<OwnerDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 15,right: 15, bottom: 15),
      width: width,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Row(
            children: [
              Container(
                //padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                child:   ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Icon(Icons.person)
                ),
              ),
              Container(
                //width: 100,
                height: 40,
                  padding: EdgeInsets.only(left: 12),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Suliman Al-mamari "),
                      Text("Owner")
                    ],
                  )
              ),
            ],
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
                    child: widget.tripOwner != widget.userID ? IconButton(
                      icon: Icon(Icons.message),
                      color: AppButtons,
                      //iconSize: 20,
                      onPressed: () {

                      },
                    ) : IconButton(
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
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.edit),
                                    title: new Text('Edit'),
                                    onTap: () {
                                      context.push("/updatetrip", extra: widget.tripID);
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

    // return  SafeArea(
    //   left: true,
    //   right: true,
    //   child: Container(
    //
    //    color: Colors.red,
    //     margin: EdgeInsets.fromLTRB(10, appPadding, 0 , appPadding),
    //     width: width,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         ClipRRect(
    //           borderRadius: BorderRadius.circular(100),
    //           child: Image.asset(
    //             'assets/villa.jfif',
    //             width: 65,
    //             height: 65,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         Container(
    //
    //           margin: EdgeInsets.only(left: 10),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 // margin: EdgeInsets.only(left: 10),
    //
    //                 child: Text("Suliman Almamari", style: TextStyle(
    //                     fontSize: 16
    //                 ),),
    //
    //               ),
    //               Container(
    //                 margin: EdgeInsets.only( top: 10),
    //
    //                 child: Text("Owner", style: TextStyle(
    //                     fontSize: 16
    //                 ),),
    //               ),
    //             ],
    //           ),
    //
    //         ),
    //           Align(
    //
    //           child: Container(
    //
    //             width: width/2.5 ,
    //             color: Colors.green,
    //       //      margin: EdgeInsets.fromLTRB(0, 10, 15 , width *0.12),
    //
    //             child: Row(
    //
    //               children: [
    //
    //                 Container(
    //
    //
    //                   padding: EdgeInsets.only(right: width/30),
    //
    //                   child: Material(
    //                     borderRadius: BorderRadius.circular(30),
    //                     color: Colors.transparent,
    //                     clipBehavior: Clip.antiAlias,
    //                     child: Ink(
    //                       width: 40,
    //                       height: 40,
    //                       decoration: BoxDecoration(
    //                           color: secondaryBackground,
    //                           border: Border.all(
    //                               color: Colors.transparent,
    //                               width: 1
    //                           )
    //                       ),
    //
    //                       child: IconButton(
    //                         icon: Icon(Icons.message),
    //                         color: AppButtons,
    //                         //iconSize: 20,
    //                         onPressed: () {
    //
    //                         },
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //
    //                 Container(
    //
    //                   child: Material(
    //                     borderRadius: BorderRadius.circular(30),
    //                     color: Colors.transparent,
    //                     clipBehavior: Clip.antiAlias,
    //                     child: Ink(
    //                       width: 40,
    //                       height: 40,
    //                       decoration: BoxDecoration(
    //                           color: secondaryBackground,
    //                           border: Border.all(
    //                               color: Colors.transparent,
    //                               width: 1
    //                           )
    //                       ),
    //
    //                       child: IconButton(
    //                         icon: Icon(Icons.call),
    //                         color: AppButtons,
    //                         //iconSize: 20,
    //                         onPressed: () {
    //
    //                         },
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         )
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}

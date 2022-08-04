import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_project/Pages/CreateTripPage.dart';
import 'package:trips_project/Pages/DetailPage.dart';
import 'package:trips_project/Pages/LoginPage.dart';
import 'package:trips_project/Pages/UpdateTripPage.dart';
import 'package:trips_project/models/trip.dart';
import 'package:trips_project/providers/trips_provider.dart';

import 'Pages/HomePage.dart';
import 'Pages/SignUpPage.dart';
import 'providers/auth_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<TripsProvider>(create: (_) => TripsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,

    );
  }

  AuthProvider ap = AuthProvider();
  final _router =
  GoRouter(initialLocation: 1 == 2 ? "/signin" : "/", routes: [
    GoRoute(path: "/", builder: (context, state) => SignUpPage()),
    GoRoute(path: "/signin", builder: (context, state) => LoginPage()),
    GoRoute(path: "/homepage", builder: (context, state) => HomePage()),
    GoRoute(path: "/createtrip", builder: (context, state) => CreateTripPage()),
    GoRoute(path: "/DetailPage", builder: (context, state) => DetailPage(trip: state.extra as Trip)),
    GoRoute(path: "/updatetrip", builder: (context, state) => UpdateTripPage(TripDetail: state.extra as Trip,)),
  ]);
  }



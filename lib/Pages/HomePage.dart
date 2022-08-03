import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trips_project/widgets/SignInAndUpWidgets/HomePageWidgets/BottomNavBar.dart';
import '../providers/auth_providers.dart';
import '../widgets/SignInAndUpWidgets/HomePageWidgets/PropertyView.dart';
import '../widgets/SignInAndUpWidgets/HomePageWidgets/SearchBar.dart';
import '../widgets/SignInAndUpWidgets/HomePageWidgets/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) =>
       Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        appBar: AppBar(
          backgroundColor: Color(0xffF8F8F8),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Welcome ${authProvider.user.username}", style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),),
          centerTitle: true,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.person,
                    size: 26.0,
                  ),
                )
            ),
          ],
        ),
        drawer: Drawer(

          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Item1'),
                  )
                ],
              ),
            ),
          ),
        ),
         body: Stack(
           children: [
             Column(

               children: [
                 Container(
                   height: 200,
                  // color: Color(0xffffb38a),
                   child: Column(
                     children: [
                       SearchBar(),
                       Categories(),
                     ],
                   ),
                 ),

                 PropertyViews(),

               ],
             ),
           ],
         ),
         bottomNavigationBar: BottomBar(),
         floatingActionButton: FloatingActionButton(
             onPressed: () {
               context.push("/createtrip");
             },
             backgroundColor: Colors.amber,
             child: const Icon(Icons.add)),
         floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
       ),
    );
  }
}

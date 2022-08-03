import 'package:flutter/cupertino.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({Key? key}) : super(key: key);

  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Image.network(
        'https://picsum.photos/seed/65/600',
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}

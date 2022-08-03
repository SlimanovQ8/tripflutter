import 'package:flutter/material.dart';
import 'package:trips_project/constants/constants.dart';

class PropertyFeatures extends StatefulWidget {
  @override
  _PropertyFeaturesState createState() => _PropertyFeaturesState();
}


class _PropertyFeaturesState extends State<PropertyFeatures> {
  int selectedCategoryIndex = 0;
  List<String> categoryList = [
    '100 m2',
    '5 Bedrooms',
    '5 Bathrooms',
    '2 Floor',
  ];
  List <IconData> icons = [
    Icons.house_siding_sharp,
    Icons.single_bed_rounded,
    Icons.bathtub,
    Icons.height,
  ];
  Widget _buildCategory(BuildContext context, int index) {

    return Padding(
            padding: EdgeInsets.only(right: appPadding / 4),
            child: Container(

              padding: EdgeInsets.symmetric(horizontal: appPadding / 2),
              decoration: BoxDecoration(
                  color: secondaryBackground,
                  borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(icons[index]),

                    Text(
                      categoryList[index],style: TextStyle(
                      fontSize: 16.5,
                      color:   Colors.black
                    ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        //
        bottom: 0,
      ),
      child: Container(

        height: size.height * 0.05,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return _buildCategory(context, index);
          },
        ),
      ),
    );
  }
}

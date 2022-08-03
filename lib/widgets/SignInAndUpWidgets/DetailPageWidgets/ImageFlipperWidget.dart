import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:trips_project/constants/constants.dart';

class ImageFlipper extends StatefulWidget {
  const ImageFlipper({Key? key}) : super(key: key);

  @override
  _ImageFlipperState createState() => _ImageFlipperState();
}

PageController? pageViewController;

class _ImageFlipperState extends State<ImageFlipper> {
  @override
  bool isClicked = false;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
      width: double.infinity,
      height: 320,
      decoration: BoxDecoration(
        color: secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Color(0x25000000),
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          PageView(
            controller: pageViewController ??= PageController(initialPage: 0),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/trips.jpg',
                  width: 100,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Image.network(
                'https://picsum.photos/seed/65/600',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Image.network(
                'https://picsum.photos/seed/641/600',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: SmoothPageIndicator(
                controller: pageViewController ??=
                    PageController(initialPage: 0),
                count: 3,
                axisDirection: Axis.horizontal,
                onDotClicked: (i) {
                  pageViewController!.animateToPage(
                    i,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                effect: ExpandingDotsEffect(
                  expansionFactor: 2,
                  spacing: 8,
                  radius: 16,
                  dotWidth: 16,
                  dotHeight: 16,
                  dotColor: Colors.white,
                  activeDotColor: AppButtons,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ),
          Positioned(
            right: 30 / 2,
            top: 30 / 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                icon: !isClicked
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
                    isClicked = !isClicked;
                  });
                },
              ),
            ),
          ),
          Positioned(
            left: 30 / 2,
            top: 30 / 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    //isClicked[index] = !isClicked[index];
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

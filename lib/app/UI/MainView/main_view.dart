import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/app/UI/MainView/main_viewmodel.dart'
    as model;

import 'package:stacked/stacked.dart';

Color _primarycolor = Color(0xff0F2F44);
Color _secondarycolor = Color(0xffEAF1FF);
Color _iconColor = Color(0xffF5C945);

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => model.MainViewmodel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topHeadingRow(),
                    SizedBox(height: 15),
                    titleText(),
                    SizedBox(height: 15),
                    filterbutton(),
                    SizedBox(height: 15),
                    Text(
                      'Best for you',
                      style: TextStyle(
                        color: _primarycolor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    product(model),
                    SizedBox(height: 15),
                    Text(
                      'Nearby your location ',
                      style: TextStyle(
                        color: _primarycolor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    nearByLocationCard(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget topHeadingRow() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 47, 68, 143),
                ),
              ),
              Text(
                'Los Angeles, CA',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _primarycolor,
                ),
              ),
            ],
          ),

          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_outline,
                color: _primarycolor,
                size: 30,
              ),
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: _secondarycolor,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget titleText() {
  return SizedBox(
    width: 250,
    child: Text(
      'Discover Best Suitable Property',
      maxLines: 2,

      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: 1.1,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: _primarycolor,
      ),
    ),
  );
}

Widget filterbutton() {
  final List filter = ['House', 'Apartment', 'Plot', 'House'];
  final int selectedIndex = 0;
  return SizedBox(
    height: 50,
    child: ListView.separated(
      itemCount: filter.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: 8),

      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;
        return TextButton(
          onPressed: () {},
          // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
          style: TextButton.styleFrom(
            backgroundColor: isSelected ? _primarycolor : _secondarycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),

          // decoration: BoxDecoration(
          //   color: isSelected ? _primarycolor : _secondarycolor,
          //   borderRadius: BorderRadius.circular(12),
          // ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              filter[index],
              style: TextStyle(
                color: isSelected ? _secondarycolor : _primarycolor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget product(model.MainViewmodel model) {
  return InkWell(
    onTap: () {
      model.navigateToProductView();
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/house1.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: _primarycolor,
                width: double.infinity,
                height: 100,
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CRAFTSMAN HOUSE',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    '520 N Btoudry Ave Los Angeles',
                    style: TextStyle(
                      height: 1,
                      fontSize: 11,
                      color: Color.fromARGB(108, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: 3),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.hotel, color: _iconColor),
                      SizedBox(width: 5),
                      Text(
                        '4 Beds',
                        style: TextStyle(
                          height: 1,
                          fontSize: 10,
                          color: Color.fromARGB(108, 255, 255, 255),
                        ),
                      ),
                      SizedBox(width: 20),

                      Icon(Icons.bathtub, color: _iconColor),
                      SizedBox(width: 5),
                      Text(
                        '4 Baths',
                        style: TextStyle(
                          height: 1,
                          fontSize: 10,
                          color: Color.fromARGB(108, 255, 255, 255),
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.directions_car, color: _iconColor),
                      SizedBox(width: 5),
                      Text(
                        '1 Garage',
                        style: TextStyle(
                          height: 1,
                          fontSize: 10,
                          color: Color.fromARGB(108, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget nearByLocationCard() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Stack(
        children: [
          Container(
            color: Color.fromARGB(209, 225, 235, 255),
            // color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          ),
          Image.asset(
            'assets/images/ranchhome.jpg',
            height: double.infinity,
            width: 100,
            fit: BoxFit.cover,
          ),

          Positioned(
            top: 25,
            left: 110,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'RANCH HOME',
                  style: TextStyle(
                    fontSize: 12,
                    color: _primarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '520 N Btoudry Ave Los Angeles',
                  style: TextStyle(
                    height: 1,
                    fontSize: 10,
                    color: _primarycolor,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.hotel, color: _iconColor),
                    SizedBox(width: 5),
                    Text(
                      '4 Beds',
                      style: TextStyle(
                        height: 1,
                        fontSize: 7,
                        color: _primarycolor,
                      ),
                    ),
                    SizedBox(width: 5),

                    Icon(Icons.bathtub, color: _iconColor),
                    SizedBox(width: 5),
                    Text(
                      '4 Baths',
                      style: TextStyle(
                        height: 1,
                        fontSize: 7,
                        color: _primarycolor,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.directions_car, color: _iconColor),
                    SizedBox(width: 5),
                    Text(
                      '1 Garage',
                      style: TextStyle(
                        height: 1,
                        fontSize: 7,
                        color: _primarycolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

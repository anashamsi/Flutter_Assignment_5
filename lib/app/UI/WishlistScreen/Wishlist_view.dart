import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/app/UI/WishlistScreen/Wishlist_viewmodel.dart';
import 'package:stacked/stacked.dart';

Color _primarycolor = Color(0xff0F2F44);
Color _secondarycolor = Color(0xffEAF1FF);
Color _iconColor = Color(0xffF5C945);

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WishlistViewmodel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topHeadingRow(WishlistViewmodel()),
                    SizedBox(height: 15),
                    product('assets/images/house1.jpg', 'CRAFTSMAN HOUSE'),
                    SizedBox(height: 15),
                    product('assets/images/house2.jpg', 'CRAFTSMAN HOUSE 1'),
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

Widget topHeadingRow(WishlistViewmodel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Wishlist',
            maxLines: 2,

            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              height: 1.1,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _primarycolor,
            ),
          ),

          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {
                model.navigateToBack();
              },
              icon: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: _primarycolor,
                  size: 30,
                ),
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

Widget product(String imagepath, String title) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: SizedBox(
      width: double.infinity,
      height: 300,
      child: Stack(
        children: [
          Image.asset(
            imagepath,
            width: double.infinity,
            height: 215,
            fit: BoxFit.cover,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '520 N Btoudry Ave Los Angeles',
                          style: TextStyle(
                            height: 1,
                            fontSize: 10,
                            color: Color.fromARGB(108, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: SizedBox(
                        width: 29,
                        height: 29,
                        child: IconButton(
                          onPressed: () {},
                          icon: Center(
                            child: Icon(
                              Icons.bookmark_outline,
                              color: _primarycolor,
                              size: 22,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: _secondarycolor,
                          ),
                        ),
                      ),
                    ),
                  ],
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
  );
}

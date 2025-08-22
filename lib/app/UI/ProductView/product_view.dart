import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/app/UI/ProductView/product_viewmodel.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked/stacked.dart';

Color _primarycolor = Color(0xff0F2F44);
Color _secondarycolor = Color(0xffEAF1FF);
Color _iconColor = Color(0xffF5C945);

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProductViewmodel(),
      builder: (model, context, child) {
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
                    productDetail(),
                    SizedBox(height: 20),
                    ownerProfile(),
                    SizedBox(height: 5),
                    readMoreText(),
                    SizedBox(height: 15),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: _primarycolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    galleryPictures(),
                    SizedBox(height: 15),
                    Text(
                      'Price',
                      style: TextStyle(
                        color: _primarycolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    priceRow(),
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
          Text(
            'Detail',
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
              onPressed: () {},
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

Widget productDetail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.asset('assets/images/image1.jpg', fit: BoxFit.cover),
        ),
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                'CRAFTSMAN HOUSE',
                style: TextStyle(
                  fontSize: 20,
                  color: _primarycolor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '520 N Beaudry Ave, Los Angeles',
                style: TextStyle(
                  fontSize: 14,
                  color: _primarycolor,
                  fontWeight: FontWeight.w500,
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

      SizedBox(height: 5),
      Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.hotel, color: _iconColor),
          SizedBox(width: 5),
          Text(
            '4 Beds',
            style: TextStyle(height: 1, fontSize: 12, color: _primarycolor),
          ),
          SizedBox(width: 20),

          Icon(Icons.bathtub, color: _iconColor),
          SizedBox(width: 5),
          Text(
            '4 Baths',
            style: TextStyle(height: 1, fontSize: 12, color: _primarycolor),
          ),
          SizedBox(width: 20),
          Icon(Icons.directions_car, color: _iconColor),
          SizedBox(width: 5),
          Text(
            '1 Garage',
            style: TextStyle(height: 1, fontSize: 12, color: _primarycolor),
          ),
        ],
      ),
    ],
  );
}

Widget ownerProfile() {
  return Row(
    children: [
      CircleAvatar(
        radius: 25,
        child: ClipOval(
          child: Image.asset('assets/images/image1.jpg', fit: BoxFit.fill),
        ),
      ),
      SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rebecca Tetha',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _primarycolor,
            ),
          ),
          Text(
            'Owner Craftsman House',
            style: TextStyle(fontSize: 12, color: _primarycolor),
          ),
        ],
      ),
      Spacer(),
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        onPressed: () {},
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Call',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        icon: Icon(Icons.call, color: Colors.white),
        iconAlignment: IconAlignment.start,
      ),
    ],
  );
}

Widget readMoreText() {
  return ReadMoreText(
    "Completely redone in 2021. 4 bedrooms. 2 bathrooms. 1 garahe. amazing curb oppeal and enterain areawater vews. Tons of built-ins & extras.",
    trimMode: TrimMode.Line,
    trimLines: 2,
    colorClickableText: _primarycolor,
    trimCollapsedText: 'Read more',
    trimExpandedText: 'Show less',
    textAlign: TextAlign.left,

    moreStyle: TextStyle(
      fontSize: 12,
      height: 0.8,
      fontWeight: FontWeight.bold,
    ),
    lessStyle: TextStyle(
      fontSize: 12,
      height: 0.8,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget galleryPictures() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 65,
        width: 70,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/images/image1.jpg', fit: BoxFit.cover),
        ),
      ),
      Container(
        height: 65,
        width: 70,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/images/image1.jpg', fit: BoxFit.cover),
        ),
      ),
      Container(
        height: 65,
        width: 70,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/images/image1.jpg', fit: BoxFit.cover),
        ),
      ),
      Container(
        height: 65,
        width: 70,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/images/image1.jpg', fit: BoxFit.cover),
        ),
      ),
    ],
  );
}

Widget priceRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        r"$5990000",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: _primarycolor,
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'BUY NOW',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}

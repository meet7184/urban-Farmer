import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/cart/cart_screen.dart';

import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';
import '../../../widget/app_bar.dart';
import '../online_gardening_screen.dart';

class GreenDetailsScreen extends StatelessWidget {
  static const String routeName = '/greenDetailsScreen';
  const GreenDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndShoppingIconAppbar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 290,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Color(0xffFDDCE0),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                    ),
                    Positioned(
                      right: -30,
                      bottom: 0,
                      child: Image.asset(AppAssets.loredanaImage, height: 220),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  child: Column(
                    children: [
                      Text(
                        "Temperature",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "25",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                shape: BoxShape.circle),
                          ),
                          Text(
                            "c",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Watering",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            "2 /",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 23),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Week",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Height",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 24),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "cm",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem Ipsum",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.black38),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Instructions : ",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.black38),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Rs.899",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(CartScreen.routeName);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.kPrimaryGreen,
                        ),
                        child: Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

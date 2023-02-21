import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/ui/widget/back_button.dart';

import '../../../../const/app_color.dart';
import '../../kitchen/gardeners_visit_screen.dart';

class CorporateDetailsScreen extends StatefulWidget {
  static const String routeName = '/corporateDetailsScreen';
  const CorporateDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CorporateDetailsScreen> createState() => _CorporateDetailsScreenState();
}

class _CorporateDetailsScreenState extends State<CorporateDetailsScreen> {
  bool bookMark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 330,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35),
                        bottomLeft: Radius.circular(35)),
                    child: Image.asset(
                      AppAssets.corporateDetailsScreenImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: CommonBackButton(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Lorem Ipsum is that it ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            bookMark = !bookMark;
                            setState(() {});
                          },
                          icon: bookMark
                              ? Icon(
                                  Icons.bookmark_border,
                                  size: 22,
                                  color: Colors.black,
                                )
                              : Icon(
                                  Icons.bookmark,
                                  size: 22,
                                  color: Colors.black,
                                )),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Lorem Ipsum is that it has a more",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text(
                        "Rs. 2400",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Person: 2",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1.5),
                  SizedBox(height: 20),
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(GardenersVisitScreen.routeName);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          height: 40,
          decoration: BoxDecoration(
            color: AppColor.kPrimaryGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Buy Now",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

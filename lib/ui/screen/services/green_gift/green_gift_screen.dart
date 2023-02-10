import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';
import '../../../widget/back_button.dart';
import '../online_gardening_screen.dart';
import 'indoor_screen.dart';

class GreenGiftScreen extends StatefulWidget {
  static const String routeName = '/greenGiftScreen';
  const GreenGiftScreen({Key? key}) : super(key: key);

  @override
  State<GreenGiftScreen> createState() => _GreenGiftScreenState();
}

class _GreenGiftScreenState extends State<GreenGiftScreen> {
  List<Categories> list = [
    const Categories(AppAssets.indoorImage, "indoor"),
    const Categories(AppAssets.outdoorImage, "outdoor"),
    const Categories(AppAssets.gardenImage2, "garden"),
    const Categories(AppAssets.officeImage, "office"),
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xffF6F4FF),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CommonBackButton(),
                          const Spacer(),
                          Icon(Icons.shopping_bag_outlined, size: 25),
                          //Image.asset(AppAssets.shoppingBagImage, height: 23),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Green",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "all space around you!",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...list
                              .asMap()
                              .map((index, value) => MapEntry(
                                  index,
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: GestureDetector(
                                      onTap: () {
                                        selectIndex = index;
                                        setState(() {});
                                      },
                                      child: selectIndex == index
                                          ? Column(
                                              children: [
                                                Image.asset(
                                                  value.image,
                                                  height: 30,
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  value.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff444444),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10))),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Image.asset(
                                                  value.image,
                                                  height: 30,
                                                  color: Colors.black38,
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  value.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 15,
                                                      color: Colors.black38),
                                                ),
                                                SizedBox(height: 10),
                                                Container(),
                                              ],
                                            ),
                                    ),
                                  )))
                              .values
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: selectIndex,
                children: const [
                  IndoorScreen(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Categories {
  final String image;
  final String name;

  const Categories(this.image, this.name);
}

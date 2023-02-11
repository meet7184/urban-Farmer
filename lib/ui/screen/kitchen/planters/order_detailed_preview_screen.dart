import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/kitchen/what_doyouwishto_grow_screen.dart';
import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';
import '../../../widget/back_button.dart';
import '../../../widget/shopping_screen.dart';

class PlantersPreviewScreen extends StatefulWidget {
  static const String routeName = "/orderDetailedPreviewScreen";
  const PlantersPreviewScreen({Key? key}) : super(key: key);

  @override
  State<PlantersPreviewScreen> createState() => _PlantersPreviewScreenState();
}

class _PlantersPreviewScreenState extends State<PlantersPreviewScreen> {
  int quantityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffB8C6B6),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonBackButton(),
                        Text(
                          "Preview",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 19),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(ShoppingScreen.routeName);
                            },
                            icon: Icon(Icons.shopping_bag_outlined, size: 26)),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 90,
                                      child: Image.asset(
                                          AppAssets.vegetableImage,
                                          fit: BoxFit.fill),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Lorem Ipsum",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16),
                                                ),
                                                Spacer(),
                                                Image.asset(
                                                  AppAssets.deleteImage,
                                                  height: 20,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "Lorem Ipsum has a verified",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rs. 2100/-",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (quantityIndex <= 0) {
                                                    } else {
                                                      quantityIndex =
                                                          quantityIndex - 1;
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 18,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(Icons.remove,
                                                        size: 15),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  quantityIndex.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () {
                                                    quantityIndex =
                                                        quantityIndex + 1;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 18,
                                                    width: 18,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(Icons.add,
                                                        size: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 40,
                    width: 240,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Total : 6578/-",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 40),
            submitButton(
              "Next",
              () => Navigator.of(context, rootNavigator: true)
                  .pushNamed(WhatDoYouWishToGrowScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

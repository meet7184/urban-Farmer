import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/services/add_order/add_order_screen.dart';

import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';

class DetailedPreviewScreen extends StatefulWidget {
  static const String routeName = "/detailedPreviewScreen";
  const DetailedPreviewScreen({Key? key}) : super(key: key);

  @override
  State<DetailedPreviewScreen> createState() => _DetailedPreviewScreenState();
}

class _DetailedPreviewScreenState extends State<DetailedPreviewScreen> {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButton(),
                        Text(
                          "Preview",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                        Image.asset(AppAssets.shoppingBagImage, height: 23),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
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
                                                  height: 22,
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
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(Icons.remove,
                                                        size: 16),
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  quantityIndex.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18,
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
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(Icons.add,
                                                        size: 16),
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
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(DetailedPreviewScreen.routeName);
                      },
                      child: Container(
                        height: 45,
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Total : 6578/-",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(AddOrderScreen.routeName);
              },
              child: Container(
                height: 45,
                width: 210,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 6,
                    )
                  ],
                  color: AppColor.kPrimaryGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

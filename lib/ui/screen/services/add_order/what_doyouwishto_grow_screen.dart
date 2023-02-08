import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/screen/services/widget/dropdown_button.dart';
import 'package:urban_farmer/ui/screen/setting/order_screen.dart';

import '../../cart/cart_screen.dart';

class WhatDoYouWishToGrowScreen extends StatefulWidget {
  static const String routeName = "/whatDoYouWishToGrowScreen";
  const WhatDoYouWishToGrowScreen({Key? key}) : super(key: key);

  @override
  State<WhatDoYouWishToGrowScreen> createState() =>
      _WhatDoYouWishToGrowScreenState();
}

class _WhatDoYouWishToGrowScreenState extends State<WhatDoYouWishToGrowScreen> {
  int quantityIndex = 0;
  String? selected;
  String? selected2;
  String? selected3;
  String? selected4;
  String? selected5;
  String? selected6;
  List<String> list = ["50 Kg bag", "100 Kg bag", "150 Kg bag", "200 Kg bag"];
  List<String> list2 = ["5 Kg bag", "10 Kg bag", "15 Kg bag", "20 Kg bag"];
  List<String> list3 = ["Cucumber", "Pumpkin", "Tomato", "Peppers"];
  List<String> list4 = ["Apple", "Papaya", "Pomegranate	", "Raspberries	"];
  List<String> list5 = ["5 Kg bag", "15 Kg bag", "25 Kg bag", "35 Kg bag"];
  List<String> list6 = ["5 Kg bag", "10 Kg bag", "15 Kg bag", "20 Kg bag"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar("Choose"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                getTitle("Soil"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CommonDropdownButton(
                        title: "- Select Quantity -",
                        items: list,
                        select: selected,
                        onChangeValue: (val) {
                          selected = val;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    getContainer(),
                  ],
                ),
                SizedBox(height: 16),
                getSuggested("Suggested : 50 Kg bag"),
                SizedBox(height: 15),
                Divider(thickness: 1.5),
                SizedBox(height: 15),
                getTitle("Organic Manure"),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                        child: CommonDropdownButton(
                      title: "- Select Quantity -",
                      items: list2,
                      select: selected2,
                      onChangeValue: (val) {
                        selected2 = val;
                      },
                    )),
                    SizedBox(width: 10),
                    getContainer(),
                  ],
                ),
                SizedBox(height: 16),
                getSuggested("Suggested : 5 Kg bag"),
                SizedBox(height: 15),
                Divider(thickness: 1.5),
                SizedBox(height: 15),
                getTitle("Seeds & Plants"),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text("Hybrid Vegetable Seeds Kit",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17)),
                    Spacer(),
                    getContainer(),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CommonDropdownButton(
                        title: "- Select Name -",
                        items: list3,
                        select: selected3,
                        onChangeValue: (val) {
                          selected3 = val;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        if (quantityIndex <= 0) {
                        } else {
                          quantityIndex = quantityIndex - 1;
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.remove, size: 14),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      quantityIndex.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        quantityIndex = quantityIndex + 1;
                        setState(() {});
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 14),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 16),
                getSuggested("1 Crop Pkt : Rs.150"),
                SizedBox(height: 20),
                getTitle("Grafted Fruit Plants"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CommonDropdownButton(
                        title: "- Select Name -",
                        items: list4,
                        select: selected4,
                        onChangeValue: (val) {
                          selected4 = val;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    getContainer(),
                  ],
                ),
                SizedBox(height: 16),
                getSuggested("1 Crop Pkt : Rs. 300"),
                SizedBox(height: 15),
                Divider(thickness: 1.5),
                SizedBox(height: 15),
                getTitle("Tools Kit Box"),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: CommonDropdownButton(
                        title: "- Select Quantity -",
                        items: list5,
                        select: selected5,
                        onChangeValue: (val) {
                          selected5 = val;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    getContainer(),
                  ],
                ),
                SizedBox(height: 15),
                Divider(thickness: 1.5),
                SizedBox(height: 15),
                getTitle("Pebels"),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: CommonDropdownButton(
                        title: "- Select Quantity -",
                        items: list6,
                        select: selected6,
                        onChangeValue: (val) {
                          selected6 = val;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    getContainer(),
                  ],
                ),
                SizedBox(height: 15),
                getSuggested("1 kg: Rs.100"),
                SizedBox(height: 15),
                Divider(thickness: 1.5),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Total : 5000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(CartScreen.routeName);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColor.kPrimaryGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Checkout",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
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
        ),
      ),
    );
  }

  Widget getTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    );
  }

  Widget getSuggested(String text) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff3150FE)),
    );
  }

  Widget getContainer() {
    return Container(
      height: 45,
      width: 100,
      decoration: BoxDecoration(
          color: AppColor.kPrimaryGreen,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Center(
          child: Text(
        "Rs. 1000",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
      )),
    );
  }
}

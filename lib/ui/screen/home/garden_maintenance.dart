import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';

import '../../../const/app_icon.dart';
import '../../widget/back_button.dart';
import '../services/services_category_screen.dart';
import '../services/widget/dropdown_button.dart';

class GardenMaintenanceScreen extends StatefulWidget {
  static const String routeName = "/gardenMaintenanceScreen";
  const GardenMaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<GardenMaintenanceScreen> createState() =>
      _GardenMaintenanceScreenState();
}

class _GardenMaintenanceScreenState extends State<GardenMaintenanceScreen> {
  String? selected;
  String? selected2;
  List<String> list = ["50 Kg bag", "100 Kg bag", "150 Kg bag", "200 Kg bag"];
  List<KitchenCountry> subscriptionList = [
    KitchenCountry(title: "Length", sqFt: "Upto 100 Sq ft."),
    KitchenCountry(title: "Width", sqFt: "Upto 200 Sq ft."),
    KitchenCountry(title: "Area", sqFt: "Upto 300 Sq ft."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Image.asset(AppAssets.serviceScreenImage),
                  ),
                  Positioned(
                      top: 100,
                      right: 0,
                      child: Image.asset(AppAssets.serviceScreenImage3,
                          height: 30)),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 6),
                              ]),
                          child: DropdownButton2(
                            hint: Center(
                              child: Text(
                                '- Choose as per the Area -',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.keyboard_arrow_down),
                            ),
                            items: subscriptionList
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item.sqFt,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              SizedBox(width: 20),
                                              SizedBox(
                                                width: 80,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Text(
                                                    item.title,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 30),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15),
                                                child: Text(
                                                  item.sqFt,
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                            thickness: 1, color: Colors.grey),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            value: selected,
                            onChanged: (value) {
                              // print("===> ${value}");
                              selected = value as String;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CommonDropdownButton(
                        title: "No. of existing plants",
                        items: list,
                        select: selected2,
                        onChangeValue: (val) {
                          selected2 = val;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ...List.generate(
                4,
                (index) => Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Starter Farm",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff999999)),
                              ),
                              SizedBox(height: 17),
                              Row(
                                children: [
                                  Text(
                                    "2499/-",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.kPrimaryGreen),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Quarterly",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                "For 100 Sqft.",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4996D1),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                          Spacer(),
                          Image.asset(AppAssets.forgotScreenImag, height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 45,
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
                        "Checkout",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 30),
        child: Row(
          children: [
            CommonBackButton(),
            Expanded(
              child: Center(
                child: Text(
                  "Ask for Gardener’s Visit",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

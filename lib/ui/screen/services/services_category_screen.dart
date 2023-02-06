import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import 'detail_kitchen_screen.dart';

class ServicesCategoryScreen extends StatefulWidget {
  static const String routeName = "/servicesCategoryScreen";
  const ServicesCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ServicesCategoryScreen> createState() => _ServicesCategoryScreenState();
}

class _ServicesCategoryScreenState extends State<ServicesCategoryScreen> {
  String? selected;
  List<KitchenCountry> dropdownList = [
    KitchenCountry(title: "Small", sqFt: "Upto 100 Sq ft."),
    KitchenCountry(title: "Medium", sqFt: "Upto 200 Sq ft."),
    KitchenCountry(title: "Large", sqFt: "Upto 300 Sq ft."),
    KitchenCountry(title: "Extended Farm", sqFt: "300 Sq ft. & Above"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "Customize for expert Kitchen \ngardening services",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                ),
                SizedBox(height: 30),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                  'Choose as per the Area',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_drop_down,
                                    color: Colors.white),
                              ),
                              items: dropdownList
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Text(
                                                    item.sqFt,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                  ],
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(DetailKitchenScreen.routeName);
                  },
                  child: Container(
                    height: 45,
                    width: 230,
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
                        "Customize",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  AppAssets.serviceScreenImage2,
                  height: 110,
                ),
                Spacer(),
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: EdgeInsets.only(right: 15, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButton(),
            Text(
              "Kitchen Garden",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
            CircleAvatar(
              backgroundImage: AssetImage(AppAssets.user),
              radius: 19,
            ),
          ],
        ),
      ),
    );
  }
}

class KitchenCountry {
  final String title;
  final String sqFt;

  KitchenCountry({
    required this.title,
    required this.sqFt,
  });
}
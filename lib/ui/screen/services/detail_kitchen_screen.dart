import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/screen/services/services_category_screen.dart';

import '../../../const/app_icon.dart';
import 'garden_all_page/garden_details_screen.dart';

class DetailKitchenScreen extends StatefulWidget {
  static const String routeName = 'detailKitchenScreen';
  const DetailKitchenScreen({Key? key}) : super(key: key);

  @override
  State<DetailKitchenScreen> createState() => _DetailKitchenScreenState();
}

class _DetailKitchenScreenState extends State<DetailKitchenScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String? selected;
  List<KitchenCountry> dropdownList = [
    KitchenCountry(title: "Small", sqFt: "Upto 100 Sq ft."),
    KitchenCountry(title: "Medium", sqFt: "Upto 200 Sq ft."),
    KitchenCountry(title: "Large", sqFt: "Upto 300 Sq ft."),
    KitchenCountry(title: "Extended Farm", sqFt: "300 Sq ft. & Above"),
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                    insets: EdgeInsets.symmetric(horizontal: 27)),
                indicatorColor: Colors.black.withOpacity(0.5),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black38,
                controller: tabController,
                onTap: (val) {},
                tabs: [
                  "Self details",
                  "Preview",
                ].map((e) => Tab(text: e)).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  selfDetails(),
                  SizedBox(),
                ],
              ),
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
          children: [
            BackButton(),
            Expanded(
              child: Center(
                child: Text(
                  "Kitchen Garden",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selfDetails() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 100),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(AppAssets.serviceScreenImage),
                Positioned(
                  left: 0,
                  right: 0,
                  top: -60,
                  child: getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTitle("House Type : "),
                        SizedBox(height: 15),
                        getTitle("Building Format : "),
                        SizedBox(height: 15),
                        getTitle("Floor : "),
                        SizedBox(height: 15),
                        getTitle("House Facing : "),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 130,
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
                            '- Select your Area',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_arrow_down_outlined),
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
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Text(
                                                item.title,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
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
                                    Divider(thickness: 1, color: Colors.grey),
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
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -40,
                  child: getContainer(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTitle("Gerden Model : "),
                        SizedBox(height: 25),
                        getTitle("No. of Planters : "),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColor.kPrimaryGreen),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3), blurRadius: 5),
                ],
              ),
              child: Center(
                child: Text(
                  "What do you wish to grow",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColor.kPrimaryGreen),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(GardenDetailsScreen.routeName);
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

  Widget getTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    );
  }

  Widget getContainer(Widget child) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
          ]),
      child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: child),
    );
  }
}

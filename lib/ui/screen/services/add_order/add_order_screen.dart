import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/services/add_order/order_details_screen.dart';

import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';
import '../../setting/order_screen.dart';
import 'order_detailed_preview_screen.dart';

class AddOrderScreen extends StatefulWidget {
  static const String routeName = "/addOrderScreen";
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar("Planters"),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 50,
                  child: TabBar(
                    isScrollable: true,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3,
                          color: AppColor.kPrimaryGreen,
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 10)),
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColor.kPrimaryGreen,
                    unselectedLabelColor: Colors.black38,
                    controller: tabController,
                    onTap: (val) {},
                    tabs: [
                      "Vegetable",
                      "Fruit",
                      "Decoratives",
                      "Vastu",
                    ].map((e) => Tab(text: e)).toList(),
                  ),
                ),
                Positioned(
                  bottom: -2,
                  left: 0,
                  right: 0,
                  child: Divider(color: Colors.grey, height: 5, thickness: 1.0),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  vegetableDetail(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(OrderDetailedPreviewScreen.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                "Preview",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget vegetableDetail() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            ...List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 110,
                            width: 100,
                            child: Image.asset(AppAssets.vegetableImage,
                                fit: BoxFit.fill),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lorem Ipsum is that",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Color (White)",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(
                                              OrderDetailsScreen.routeName);
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: AppColor.kPrimaryGreen,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}

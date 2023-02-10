import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/kitchen/planters/order_details_screen.dart';
import 'package:urban_farmer/ui/widget/back_button.dart';

import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';
import '../../../widget/app_bar.dart';
import '../../setting/order_screen.dart';
import 'order_detailed_preview_screen.dart';

class PlantersOrderScreen extends StatefulWidget {
  static const String routeName = "/addOrderScreen";
  const PlantersOrderScreen({Key? key}) : super(key: key);

  @override
  State<PlantersOrderScreen> createState() => _PlantersOrderScreenState();
}

class _PlantersOrderScreenState extends State<PlantersOrderScreen>
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
      appBar: backAndTextAndIconAppBar("Planters"),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: submitButton(
          "Preview",
          () => Navigator.of(context, rootNavigator: true)
              .pushNamed(PlantersPreviewScreen.routeName),
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

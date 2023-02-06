import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/screen/services/garden_all_page/vegetable_screen.dart';

import '../../../../const/app_icon.dart';
import '../../setting/order_screen.dart';
import 'garden_detailed_preview_screen.dart';

class GardenDetailsScreen extends StatefulWidget {
  static const String routeName = "/gardenDetailsScreen";
  const GardenDetailsScreen({Key? key}) : super(key: key);

  @override
  State<GardenDetailsScreen> createState() => _GardenDetailsScreenState();
}

class _GardenDetailsScreenState extends State<GardenDetailsScreen>
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
      appBar: appBar("Kitchen Garden"),
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
                children: const [
                  VegetableScreen(),
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
          Navigator.of(context).pushNamed(DetailedPreviewScreen.routeName);
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
}

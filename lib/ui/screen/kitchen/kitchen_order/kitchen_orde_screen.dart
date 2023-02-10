import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/screen/kitchen/kitchen_order/vegetable_screen.dart';

import '../../../../const/app_icon.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/back_button.dart';
import '../../setting/order_screen.dart';
import '../kitchen_detailed_preview_screen.dart';

class KitchenOrderScreen extends StatefulWidget {
  static const String routeName = "/gardenDetailsScreen";
  const KitchenOrderScreen({Key? key}) : super(key: key);

  @override
  State<KitchenOrderScreen> createState() => _KitchenOrderScreenState();
}

class _KitchenOrderScreenState extends State<KitchenOrderScreen>
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
      appBar: backAndTextAndIconAppBar("Kitchen Garden"),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        child: submitButton(
          "Preview",
          () => Navigator.of(context, rootNavigator: true)
              .pushNamed(KitchenDetailedPreviewScreen.routeName),
        ),
      ),
    );
  }
}

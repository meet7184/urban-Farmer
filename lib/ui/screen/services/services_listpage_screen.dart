import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/services/services_category_screen.dart';
import '../../../const/app_icon.dart';
import '../../widget/back_button.dart';
import '../home/corporate_gifts/corporate_gifts_screen.dart';
import '../home/garden_maintenance.dart';
import 'green_gift_screen.dart';
import 'online_gardening_screen.dart';

class ServicesListPageScreen extends StatefulWidget {
  static const String routeName = "/servicesListPageScreen";
  const ServicesListPageScreen({Key? key}) : super(key: key);

  @override
  State<ServicesListPageScreen> createState() => _ServicesListPageScreenState();
}

class _ServicesListPageScreenState extends State<ServicesListPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(ServicesCategoryScreen.routeName);
                  },
                  child: getGardenListRight(
                      Color(0xffff8e1e3),
                      "Kitchen Garden",
                      "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a more-or-less",
                      AppAssets.kitchenGardenImage),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(GardenMaintenanceScreen.routeName);
                  },
                  child: getGardenListLeft(
                      Color(0xffffe9e1),
                      "Garden Maintenance",
                      "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                      AppAssets.kitchenGardenImage2),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CorporateGiftsScreen.routeName);
                  },
                  child: getGardenListRight(
                      Color(0xffbfdadb),
                      "Corporate Gift",
                      "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                      AppAssets.kitchenGardenImage),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(GreenGiftScreen.routeName);
                  },
                  child: getGardenListLeft(
                      Color(0xffC8DCB7),
                      "Green Gift",
                      "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                      AppAssets.kitchenGardenImage2),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(OnlineGardeningScreen.routeName);
                  },
                  child: getGardenListRight(
                      Color(0xffdee6ec),
                      "Online Gardening",
                      "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                      AppAssets.kitchenGardenImage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(45),
      child: Padding(
        padding: EdgeInsets.only(top: 25, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonBackButton(),
            CircleAvatar(
              backgroundImage: AssetImage(AppAssets.user),
              radius: 19,
            ),
          ],
        ),
      ),
    );
  }

  Widget getGardenListRight(
      Color color, String title, String description, String image) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    description,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getGardenListLeft(
      Color color, String title, String description, String image) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                height: 120,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Text(
                      description,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

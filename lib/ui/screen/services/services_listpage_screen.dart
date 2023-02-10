import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/kitchen/services_category_screen.dart';
import '../../../const/app_icon.dart';
import '../../widget/app_bar.dart';
import '../../widget/back_button.dart';
import 'corporate_gifts/corporate_gifts_screen.dart';
import 'garden_maintenance.dart';
import 'green_gift/green_gift_screen.dart';
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
      appBar: backAndUserAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 20),
                getGardenListRight(
                  Color(0xffff8e1e3),
                  "Kitchen Garden",
                  "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a more-or-less",
                  AppAssets.kitchenGardenImage,
                  () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(ServicesCategoryScreen.routeName),
                ),
                SizedBox(height: 15),
                getGardenListLeft(
                  Color(0xffffe9e1),
                  "Garden Maintenance",
                  "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                  AppAssets.kitchenGardenImage2,
                  () => Navigator.of(context, rootNavigator: true)
                      .pushNamed(GardenMaintenanceScreen.routeName),
                ),
                SizedBox(height: 15),
                getGardenListRight(
                  Color(0xffbfdadb),
                  "Corporate Gift",
                  "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                  AppAssets.kitchenGardenImage,
                  () => Navigator.of(context)
                      .pushNamed(CorporateGiftsScreen.routeName),
                ),
                SizedBox(height: 15),
                getGardenListLeft(
                  Color(0xffC8DCB7),
                  "Green Gift",
                  "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                  AppAssets.kitchenGardenImage2,
                  () => Navigator.of(context)
                      .pushNamed(GreenGiftScreen.routeName),
                ),
                SizedBox(height: 15),
                getGardenListRight(
                  Color(0xffdee6ec),
                  "Online Gardening",
                  "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a",
                  AppAssets.kitchenGardenImage,
                  () => Navigator.of(context)
                      .pushNamed(OnlineGardeningScreen.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getGardenListRight(Color color, String title, String description,
      String image, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }

  Widget getGardenListLeft(Color color, String title, String description,
      String image, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Text(
                        description,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

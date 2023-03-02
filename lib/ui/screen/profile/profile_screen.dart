import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/ui/screen/profile/profile_edit_screen.dart';
import 'package:urban_farmer/ui/screen/profile/t&c_screen.dart';
import 'package:urban_farmer/ui/screen/setting/setting_screen.dart';
import 'package:urban_farmer/ui/screen/setting/subscription_screen.dart';
import 'package:urban_farmer/ui/screen/splash/splash_screen.dart';
import '../../../core/utils/app_prefs.dart';
import '../../../core/utils/global.dart';
import '../../widget/back_button.dart';
import '../../widget/shopping_screen.dart';
import '../setting/my_coupons_screen.dart';
import '../setting/order_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "/profileScreen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> list = [
    "My Profile",
    "Subscription",
    "My Coupons",
    "Saved",
    "Order History",
    "Settings",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      height: 370,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xffC8DCB7),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(65),
                            bottomRight: Radius.circular(65)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonBackButton(),
                                Text(
                                  "Profile ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 25),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          ProfileEditScreen.routeName);
                                    },
                                    icon: Icon(Icons.edit)),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 115,
                            width: 115,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(AppAssets.profileImage))),
                            child: Image.asset(AppAssets.circalImage),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "John Davis",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 19),
                          ),
                          Text(
                            "+91 9925808943",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 400,
                      width: double.infinity,
                      color: Color(0xffF5F5F5),
                    )
                  ],
                ),
                Positioned(
                  top: 325,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 440,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ...list
                            .asMap()
                            .map((index, value) => MapEntry(
                                  index,
                                  GestureDetector(
                                    onTap: () {
                                      if (index == 0) {
                                        Navigator.of(context).pushNamed(
                                            ProfileEditScreen.routeName);
                                      }
                                      if (index == 1) {
                                        Navigator.of(context).pushNamed(
                                            SubscriptionScreen.routeName);
                                      }
                                      if (index == 2) {
                                        Navigator.of(context).pushNamed(
                                            MyCouponsScreen.routeName);
                                      }
                                      if (index == 3) {
                                        Navigator.of(context).pushNamed(
                                            FavoriteLitScreen.routeName);
                                      }
                                      if (index == 4) {
                                        Navigator.of(context)
                                            .pushNamed(OrderScreen.routeName);
                                      }
                                      if (index == 5) {
                                        Navigator.of(context).pushNamed(
                                            SettingsScreen.routeName);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, top: 25),
                                      height: 30,
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Text(
                                            value,
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .values
                            .toList(),
                        SizedBox(height: 30),
                        Text(
                          "Switch to other account",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff447AFF)),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text(
                                  "Log Out",
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                content: Text(
                                  "Are You Sure..",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      appController.userModelData = null;
                                      GetIt.I.get<AppPrefs>().clear();
                                      print(
                                          "=========> ${appController.userModelData}");
                                      Navigator.of(context)
                                          .pushNamed(SplashScreen.routeName);
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Log Out",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w800),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context)
                        //         .pushNamed(SplashScreen.routeName);
                        //   },
                        //   child: Text(
                        //     "Log Out",
                        //     style: const TextStyle(
                        //         fontSize: 17, fontWeight: FontWeight.w800),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

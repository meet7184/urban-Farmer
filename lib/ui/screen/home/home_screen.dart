import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/ui/screen/home/controller/products_controller.dart';
import 'package:urban_farmer/ui/screen/home/product_categories/view_all_screen.dart';
import 'package:urban_farmer/ui/screen/home/product_screen.dart';
import 'package:urban_farmer/ui/screen/home/top_products_screen.dart';
import 'package:urban_farmer/ui/screen/profile/t&c_screen.dart';
import 'package:urban_farmer/ui/screen/services/garden_maintenance.dart';
import 'package:urban_farmer/ui/screen/home/wigdet/carousel_withindicator.dart';
import 'package:urban_farmer/ui/screen/profile/profile_screen.dart';
import 'package:urban_farmer/ui/screen/services/services_listpage_screen.dart';
import '../services/corporate_gifts/corporate_gifts_screen.dart';
import '../kitchen/services_category_screen.dart';
import '../setting/order_screen.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  List<HomeServices> servicesList = [
    const HomeServices(
        AppAssets.kitchenImage, "Kitchen Garden", Color(0xffB8DBDB)),
    const HomeServices(
        AppAssets.gardenImage, "Garden Maintenance", Color(0xffD7C8BD)),
    const HomeServices(
        AppAssets.kitchenImage, "Corporate Gifts", Color(0xffB8DBDB)),
    const HomeServices(
        AppAssets.gardenImage, "Garden Maintenance", Color(0xffD7C8BD)),
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> list = ["FAQs", "CONTACT US", "LEGAL", "T&C"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      drawer: drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Services",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColor.kPrimaryGreen),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ServicesListPageScreen.routeName);
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColor.kBlack),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: servicesList
                        .asMap()
                        .map((index, value) => MapEntry(
                              index,
                              GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(
                                            ServicesCategoryScreen.routeName);
                                  }
                                  if (index == 1) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(
                                            GardenMaintenanceScreen.routeName);
                                  }
                                  if (index == 2) {
                                    Navigator.of(context).pushNamed(
                                        CorporateGiftsScreen.routeName);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    height: 110,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: value.color,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                              child: Image.asset(value.image,
                                                  height: 60)),
                                          Text(
                                            value.text,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 12),
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        .values
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              const CarouselWithIndicator(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Top Products",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(ProductScreen.routeName);
                            //arguments: 90);
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColor.kBlack),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    GetBuilder(
                      builder: (ProductsController controller) {
                        if (controller.isLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: controller.trendingProductsList
                                .asMap()
                                .map((index, value) => MapEntry(
                                      index,
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pushNamed(
                                                  TopProductsScreen.routeName);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 6),
                                          child: Container(
                                            height: 120,
                                            width: 90,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                    AppAssets.gamlaImage)),
                                          ),
                                        ),
                                      ),
                                    ))
                                .values
                                .toList(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          "Lorem Ipum",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(TopProductsScreen.routeName);
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColor.kBlack),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GetBuilder(
                      builder: (ProductsController controller) {
                        if (controller.isLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Column(
                          children: controller.trendingProductsList
                              .asMap()
                              .map((index, value) => MapEntry(
                                  index,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 130,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                  AppAssets.gamlaImage)),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .trendingProductsList[
                                                          index]
                                                      .productsName,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  "Plant",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(height: 15),
                                                Text(
                                                  "Rs. ${controller.trendingProductsList[index].productsMrp}/-",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )))
                              .values
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? drawer() {
    return Container(
      width: 260,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 260,
            color: AppColor.kPrimaryGreen,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.account_box, size: 30),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Hello, John Davis",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(ViewAllScreen.routeName);
              },
              child: Row(
                children: [
                  Icon(Icons.border_all_rounded,
                      color: Colors.black38, size: 22),
                  SizedBox(width: 20),
                  Text(
                    "Shop by Categories",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 1.5),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(OrderScreen.routeName);
              },
              child: Row(
                children: [
                  Icon(Icons.gif_box_rounded, color: Colors.black38, size: 22),
                  SizedBox(width: 20),
                  Text(
                    "Order",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 1.5),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...list
                    .asMap()
                    .map((index, value) => MapEntry(
                        index,
                        GestureDetector(
                          onTap: () {
                            if (index == 3) {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(TcScreen.routeName);
                            }
                          },
                          child: Container(
                            height: 30,
                            width: double.infinity,
                            color: Colors.transparent,
                            margin: EdgeInsets.only(bottom: 15),
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black38),
                            ),
                          ),
                        )))
                    .values
                    .toList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Image.asset(AppAssets.drawer)),
            const Text(
              "Urban Farmer",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(ProfileScreen.routeName);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.user),
                radius: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeServices {
  final String image;
  final String text;
  final Color color;

  const HomeServices(this.image, this.text, this.color);
}

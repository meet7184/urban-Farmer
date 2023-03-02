import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/ui/screen/home/controller/products_controller.dart';
import 'package:urban_farmer/ui/screen/home/product_categories/sub_categories_screen.dart';
import 'package:urban_farmer/ui/screen/home/product_categories/view_all_screen.dart';
import 'package:urban_farmer/ui/screen/home/product_details_screen.dart';
import 'package:urban_farmer/ui/widget/app_bar.dart';
import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../../../core/network/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../../../core/utils/global.dart';
import 'controller/categories_controller.dart';

// class ProductArgs {
//   final int index;
//   ProductArgs(this.index);
// }

class ProductScreen extends StatefulWidget {
  static const String routeName = '/productScreen';
  //final ProductArgs index;
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool bookMark = true;
  @override
  Widget build(BuildContext context) {
    //print(widget.index);
    return Scaffold(
      appBar: backAndUserAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(ViewAllScreen.routeName);
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
                SizedBox(height: 15),
                GetBuilder(
                  builder: (CategoriesController controller) {
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: controller.categoriesList
                            .asMap()
                            .map((index, value) => MapEntry(
                                  index,
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(
                                              SubCategoriesScreen.routeName,
                                              arguments: value.categoriesId);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.asset(
                                                    AppAssets.plantImage)),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            value.categoriesName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
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
                SizedBox(height: 20),
                Text(
                  "Recent Search",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                height: 38,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                            )),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Trending Products",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                GetBuilder(
                  builder: (ProductsController controller) {
                    if (controller.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: controller.trendingProductsList
                            .asMap()
                            .map((index, value) => MapEntry(
                                index,
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(
                                            ProductDetailsScreen.routeName,
                                            arguments: value.productsId);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    color: Colors.transparent,
                                    width: 120,
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 130,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                    AppAssets.gamlaImage,
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            value.productsName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Rs.${value.productsMrp}/-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )))
                            .values
                            .toList(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 25),
                Text(
                  "New Arrivals",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 15),
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
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 130,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                      AppAssets.gamlaImage)),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value.productsName,
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
                                                    SizedBox(height: 10),
                                                    Text(
                                                      "Rs. ${value.productsMrp}/-",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(),
                                                        Spacer(),
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                              if (bookMark ==
                                                                  false) {
                                                                final response = await controller.isFavorite(
                                                                    appController
                                                                        .userModelData!
                                                                        .userId,
                                                                    value
                                                                        .productsId);
                                                                response.when(
                                                                  success:
                                                                      (data) {
                                                                    bookMark =
                                                                        true;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  failure: (ErrorType
                                                                          type,
                                                                      String?
                                                                          message) {
                                                                    showToast(
                                                                        getMessageFromErrorType(
                                                                            type));
                                                                  },
                                                                );
                                                              } else {
                                                                final response = await controller.isFavorite(
                                                                    appController
                                                                        .userModelData!
                                                                        .userId,
                                                                    value
                                                                        .productsId);
                                                                response.when(
                                                                  success:
                                                                      (data) {
                                                                    bookMark =
                                                                        false;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  failure: (ErrorType
                                                                          type,
                                                                      String?
                                                                          message) {
                                                                    showToast(
                                                                        getMessageFromErrorType(
                                                                            type));
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            icon: bookMark ==
                                                                    false
                                                                ? Icon(
                                                                    Icons
                                                                        .bookmark_border,
                                                                    size: 22,
                                                                    color: Colors
                                                                        .black,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .bookmark,
                                                                    size: 22,
                                                                    color: Colors
                                                                        .black,
                                                                  )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .values
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

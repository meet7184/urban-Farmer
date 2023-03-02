import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/ui/screen/home/controller/categories_controller.dart';
import 'package:urban_farmer/ui/screen/home/product_categories/filter_screen.dart';
import '../../../widget/app_bar.dart';
import '../controller/products_controller.dart';
import '../wigdet/bottom_sheet_screen.dart';

class ProductsListViewAllScreen extends StatefulWidget {
  static const String routeName = "/productsListViewAllScreen";
  const ProductsListViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ProductsListViewAllScreen> createState() =>
      _ProductsListViewAllScreenState();
}

class _ProductsListViewAllScreenState extends State<ProductsListViewAllScreen> {
  bool bookMark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: textAndBackAndUserAppBar("Products List"),
      body: GetBuilder(
        builder: (ProductsController controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  AlignedGridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.trendingProductsList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 10),
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 185,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(AppAssets.gamlaImage,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.trendingProductsList[index]
                                          .productsName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "Planters",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          "Rs. ${controller.trendingProductsList[index].productsMrp}/-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              bookMark = !bookMark;
                                              setState(() {
                                                if (bookMark) {
                                                  print("true");
                                                } else {
                                                  print("false");
                                                }
                                              });
                                            },
                                            icon: bookMark
                                                ? Icon(
                                                    Icons.bookmark_border,
                                                    size: 22,
                                                    color: Colors.black,
                                                  )
                                                : Icon(
                                                    Icons.bookmark,
                                                    size: 22,
                                                    color: Colors.black,
                                                  )),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 55,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 40),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  sortBottomSheet();
                },
                child: Container(
                  width: 120,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_double_arrow_up_rounded, size: 22),
                      Text(
                        "SORT",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(FilterScreen.routeName);
                },
                child: Container(
                  width: 120,
                  color: Colors.transparent,
                  child: Row(
                    children: const [
                      Icon(Icons.keyboard_double_arrow_down_rounded, size: 22),
                      Text(
                        "FILTER",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
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

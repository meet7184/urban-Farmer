import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../const/app_icon.dart';
import '../../widget/app_bar.dart';
import 'controller/products_controller.dart';

class TopProductsScreen extends StatefulWidget {
  static const String routeName = '/topProductsScreen';
  const TopProductsScreen({Key? key}) : super(key: key);

  @override
  State<TopProductsScreen> createState() => _TopProductsScreenState();
}

class _TopProductsScreenState extends State<TopProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: textAndBackAndUserAppBar("All Products"),
      body: GetBuilder(
        builder: (ProductsController controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    AlignedGridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.trendingProductsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(AppAssets.gamlaImage,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.trendingProductsList[index]
                                              .productsName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Rs. ${controller.trendingProductsList[index].productsMrp}/-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:urban_farmer/ui/screen/home/controller/categories_controller.dart';
import 'package:urban_farmer/ui/screen/home/controller/home_controller.dart';
import 'package:urban_farmer/ui/screen/home/product_categories/proucts_list_view_all_screen.dart';
import 'package:urban_farmer/ui/screen/home/product_categories/sub_categories_screen.dart';
import '../../../../const/app_icon.dart';
import '../../../widget/app_bar.dart';

class ViewAllScreen extends StatefulWidget {
  static const String routeName = "/viewAllScreen";
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  @override
  void dispose() {
    Get.delete<CategoriesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: textAndBackAndUserAppBar("Categories"),
      body: GetBuilder(
        builder: (CategoriesController controller) {
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
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.categoriesList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(SubCategoriesScreen.routeName,
                                      arguments: controller
                                          .categoriesList[index].categoriesId);
                            },
                            child: Container(
                              height: 180,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 140,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(AppAssets.plantImage,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    controller
                                        .categoriesList[index].categoriesName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
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

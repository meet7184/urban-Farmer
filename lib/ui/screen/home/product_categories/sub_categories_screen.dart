import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/ui/screen/home/controller/categories_controller.dart';
import 'package:urban_farmer/ui/screen/home/controller/sub_category_controller.dart';
import 'package:urban_farmer/ui/screen/home/product_categories/proucts_list_view_all_screen.dart';
import '../../../../const/app_icon.dart';
import '../../../widget/app_bar.dart';

class SubCategoriesScreen extends StatefulWidget {
  static const String routeName = "/subCategoriesScreen";
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: textAndBackAndUserAppBar("Sub Categories"),
      body: GetBuilder(
        builder: (SubCategoryController controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          print("==========> ${controller.subCategoryList.length}");
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
                        itemCount: controller.subCategoryList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(
                                      ProductsListViewAllScreen.routeName);
                            },
                            child: Container(
                              height: 200,
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
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 17),
                                      child: Text(
                                        controller.subCategoryList[index]
                                            .productsName,
                                        //overflow: TextOverflow.ellipsis,
                                        //maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          // : Center(
                          //     child: Text(
                          //       "No data",
                          //       style: TextStyle(fontSize: 25),
                          //     ),
                          //   );
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

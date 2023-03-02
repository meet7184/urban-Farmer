import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/ui/screen/cart/cart_screen.dart';
import 'package:urban_farmer/ui/screen/saved/controller/saved_controller.dart';
import '../../../const/app_icon.dart';

class SavedScreen extends StatefulWidget {
  static const String routeName = 'savedScreen';
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void dispose() {
    Get.delete<SavedController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: GetBuilder(
        builder: (SavedController controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  AlignedGridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.wishFavoriteList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 135,
                                      width: double.infinity,
                                      child: Image.asset(
                                          AppAssets.annieSprattImage,
                                          fit: BoxFit.fill),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.black),
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Image.asset(
                                              AppAssets.removeImage),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.wishFavoriteList[index]
                                              .productsName,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Rs. ${controller.wishFavoriteList[index].productsMrp}/-",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            "Rs. ${controller.wishFavoriteList[index].productsSalePrice}/-",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(thickness: 1.5),
                                Center(
                                  child: Text(
                                    "Move To Bag",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ));
                      }),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 15, top: 30),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                //Navigator.of(context).pushNamed(HomeScreen.routeName);
                // Navigator.pop(context);
              },
              child: Image.asset(
                AppAssets.arrowImage,
                height: 20,
              ),
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wishlist",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                Text(
                  "12 items",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.edit, size: 27),
            SizedBox(width: 20),
            GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(CartScreen.routeName);
                },
                child: Icon(Icons.shopping_bag_outlined, size: 28)),
          ],
        ),
      ),
    );
  }
}

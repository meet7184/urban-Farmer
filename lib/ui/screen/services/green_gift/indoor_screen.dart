import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../const/app_icon.dart';
import '../../cart/cart_screen.dart';
import 'green_details_screen.dart';

class IndoorScreen extends StatelessWidget {
  const IndoorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          AlignedGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 25,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(GreenDetailsScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color(0xffFDDCE0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -25,
                          left: 0,
                          right: 0,
                          child: Image.asset(AppAssets.stephanieImage,
                              height: 130),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 40,
                          child: Center(
                            child: Text(
                              "Cactus",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: -25,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed(CartScreen.routeName);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(CartScreen.routeName);
                                  },
                                  icon: Center(
                                    child: Icon(Icons.shopping_bag_outlined,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

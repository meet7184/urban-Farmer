import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/home/product_details_screen.dart';
import 'package:urban_farmer/ui/widget/app_bar.dart';
import '../../../const/app_icon.dart';
import '../../widget/back_button.dart';

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
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        4,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child:
                                            Image.asset(AppAssets.plantImage)),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Planters",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            )),
                  ),
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
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        4,
                        (index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed(ProductDetailsScreen.routeName);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 130,
                                        width: 100,
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
                                      SizedBox(height: 5),
                                      Text(
                                        "Lorem Lpsum",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Rs. 456/-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "New Arrivals",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 15),
                Column(
                  children: List.generate(
                      4,
                      (index) => GestureDetector(
                            onTap: () {
                              // Navigator.of(context, rootNavigator: true)
                              //     .pushNamed(ProductDetailsScreen.routeName);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                color: Colors.transparent,
                                child: Padding(
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
                                                "Lorem Ipsum has been the industry's",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
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
                                                "Rs. 456/-",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              Row(
                                                children: [
                                                  Container(),
                                                  Spacer(),
                                                  Image.asset(
                                                      AppAssets.bookImage,
                                                      height: 18),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

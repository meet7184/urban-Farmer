import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/ui/screen/cart/controller/car_controller.dart';
import '../../../const/app_icon.dart';
import '../../widget/app_bar.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = "/orderScreen";
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTextAndIconAppBar("Preview"),
      body: SafeArea(
        child: Column(
          children: [
            Divider(thickness: 2),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xffD9D9D9))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Image.asset(
                                        AppAssets.delivereImage,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Delivered",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        "On Sat, 12 Jan",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 160,
                                width: double.infinity,
                                color: Color(0xffF5F5F5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 20, right: 10),
                                          height: 100,
                                          width: 100,
                                          child: Image.asset(
                                              AppAssets.annieSprattImage),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Lorem Ipsum",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  "Size : 21”",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                Text(
                                                  "Lorem Ipsum is that it has a more-or-less normal dis",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15),
                                                  child: Row(
                                                    children: [
                                                      Container(),
                                                      Spacer(),
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_sharp,
                                                        size: 14,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  "Size : 21”",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 10),
                                      child: Text(
                                        "Lorem Ipsum is that it has a more-or-less normal dis",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Showing 1 - 4 of 8",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "New",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 14),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios_sharp, size: 10),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

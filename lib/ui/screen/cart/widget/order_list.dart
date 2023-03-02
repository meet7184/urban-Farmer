import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:urban_farmer/ui/screen/cart/controller/car_controller.dart';

import '../../../../const/app_icon.dart';
import '../../../../core/network/utils/base_response.dart';
import '../../../../core/utils/flitter_toast.dart';
import '../../../../core/utils/global.dart';

class OrderCartList extends StatefulWidget {
  const OrderCartList({Key? key}) : super(key: key);

  @override
  State<OrderCartList> createState() => _OrderCartListState();
}

class _OrderCartListState extends State<OrderCartList> {
  String decrement = "decrement";
  String increment = "increment";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CartController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: List.generate(
                controller.cartList.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 90,
                            child: Image.asset(AppAssets.lakeishaImage,
                                fit: BoxFit.fill),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller
                                              .cartList[index].productsName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final response = await controller
                                              .cartProductDelete(
                                                  appController
                                                      .userModelData!.userId,
                                                  controller.cartList[index]
                                                      .productsId);
                                          response.when(
                                            success: (data) {
                                              controller.removeList(
                                                  controller.cartList[index]);
                                            },
                                            failure: (ErrorType type,
                                                String? message) {
                                              showToast(getMessageFromErrorType(
                                                  type));
                                            },
                                          );
                                        },
                                        child: Image.asset(
                                          AppAssets.deleteImage,
                                          height: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Lorem Ipsum has a verified",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        "Rs. ${controller.cartList[index].productsSalePrice}/-",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () async {
                                          if (controller.cartList[index].qty !=
                                              1) {
                                            final response =
                                                await controller.updateCart(
                                                    decrement,
                                                    appController
                                                        .userModelData!.userId,
                                                    controller.cartList[index]
                                                        .productsId);
                                            response.when(
                                              success: (data) {
                                                if (controller
                                                        .cartList[index].qty ==
                                                    1) {
                                                  controller.quntityless(index);
                                                } else {
                                                  controller.quntityless(index);
                                                }
                                              },
                                              failure: (ErrorType type,
                                                  String? message) {
                                                showToast(
                                                    getMessageFromErrorType(
                                                        type));
                                              },
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.remove, size: 15),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        controller.cartList[index].qty
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () async {
                                          final response =
                                              await controller.updateCart(
                                                  increment,
                                                  appController
                                                      .userModelData!.userId,
                                                  controller.cartList[index]
                                                      .productsId);
                                          response.when(
                                            success: (data) {
                                              controller.quntitiyPlus(index);
                                            },
                                            failure: (ErrorType type,
                                                String? message) {
                                              showToast(getMessageFromErrorType(
                                                  type));
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.add, size: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
          ),
        );
      },
    );
  }
}

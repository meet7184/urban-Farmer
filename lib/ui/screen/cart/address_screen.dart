import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/core/utils/global.dart';
import 'package:urban_farmer/ui/screen/cart/controller/car_controller.dart';
import 'package:urban_farmer/ui/screen/cart/widget/order_list.dart';
import '../../../const/app_color.dart';
import '../../../core/network/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import 'add_address_screen.dart';
import 'order_list_screen.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/addressScreen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  CartController controller = Get.find<CartController>();
  int addressIndex = 0;
  int? index2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator(
        onRefresh: () async {
          controller.addAddressListData();
        },
        child: GetBuilder(
          builder: (CartController controller) {
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    height: 220,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3), blurRadius: 4)
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                "Select",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AddAddressScreen.routeName);
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Icon(Icons.add, size: 13),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  ...controller.addressList
                                      .asMap()
                                      .map((index, value) => MapEntry(
                                          index,
                                          SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    addressIndex = index;
                                                    print(
                                                        "index ==========> $addressIndex");
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    width: double.infinity,
                                                    color: Colors.transparent,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "${value.name},  (Pincode: ${value.pincode})",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Spacer(),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  addressIndex =
                                                                      index;
                                                                  print(
                                                                      "index ==========> $addressIndex");

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 18,
                                                                  width: 18,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  child: addressIndex ==
                                                                          index
                                                                      ? Center(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                10,
                                                                            width:
                                                                                10,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            "${value.address1}${value.city}${value.state}",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColor
                                                                    .kTextColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(thickness: 1.5),
                                              ],
                                            ),
                                          )))
                                      .values
                                      .toList(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(height: 30),
                  OrderCartList(),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(height: 3, width: 80, color: Colors.grey),
                        SizedBox(height: 20),
                        Text(
                          "Price Details",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "Price(${controller.orderCountModel!.count} items)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                              Spacer(),
                              Text(
                                "Rs. ${controller.totalPrice.toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "Discounts",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                              Spacer(),
                              Text(
                                "No Discounts",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    color: AppColor.kPrimaryGreen),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 1.5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                              Spacer(),
                              Text(
                                "Rs. ${controller.totalPrice.toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            print("=========> $addressIndex");
                            final response = await controller.getOrderPlace(
                              appController.userModelData!.userId,
                              controller.addressList[addressIndex].name,
                              controller.addressList[addressIndex].phone,
                              controller.addressList[addressIndex].email,
                              controller.addressList[addressIndex].address1,
                              controller.addressList[addressIndex].city,
                              controller.addressList[addressIndex].state,
                              controller.addressList[addressIndex].pincode,
                            );
                            response.when(
                              success: (data) {
                                Navigator.of(context)
                                    .pushNamed(OrderListScreen.routeName);
                              },
                              failure: (ErrorType type, String? message) {
                                showToast(getMessageFromErrorType(type));
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            height: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 4)
                              ],
                              color: AppColor.kPrimaryGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Checkout",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/screen/cart/controller/car_controller.dart';
import 'package:urban_farmer/ui/screen/cart/widget/order_list.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
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
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Apply Coupon",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Save Rs. 120 with URBANNEW",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_sharp, size: 16),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
                      onTap: () {},
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
    );
  }
}

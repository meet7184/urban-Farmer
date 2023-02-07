import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import '../../../const/app_icon.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  int quantityIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4)
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
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Save Rs. 120 with URBANNEW",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp, size: 18),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: List.generate(
                  3,
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
                                      children: [
                                        Text(
                                          "Lorem Ipsum",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                        Spacer(),
                                        Image.asset(
                                          AppAssets.deleteImage,
                                          height: 22,
                                          color: Colors.black,
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
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text(
                                          "Rs. 2100/-",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            if (quantityIndex <= 0) {
                                            } else {
                                              quantityIndex = quantityIndex - 1;
                                              setState(() {});
                                            }
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.remove, size: 16),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          quantityIndex.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            quantityIndex = quantityIndex + 1;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(Icons.add, size: 16),
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
          ),
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
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Price (3 items)",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19),
                      ),
                      Spacer(),
                      Text(
                        "Rs. 5750",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
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
                            fontWeight: FontWeight.w600, fontSize: 19),
                      ),
                      Spacer(),
                      Text(
                        "- Rs. 750",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
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
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                      Spacer(),
                      Text(
                        "Rs. 5000",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.kPrimaryGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white),
                        ),
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
  }
}

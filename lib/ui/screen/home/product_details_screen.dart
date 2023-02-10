import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/screen/cart/cart_screen.dart';
import '../../../const/app_icon.dart';
import '../../widget/app_bar.dart';
import '../../widget/back_button.dart';
import '../setting/order_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "/productDetailsScreen";
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int availableSizeSelectIndex = 1;
  int selectIndex = 0;
  List<String> availableSizeList = ["10", "11", "12", "15", "20"];
  List<String> list = ["square", "Hexagon", "Pentagon"];
  int quantityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTextAndIconAppBar("Product Details"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Center(child: Image.asset(AppAssets.galinaImage, height: 250)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      "Rs. 1450",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lorem Ipsum Brown",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Rs. 1000",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Available Size",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "Inch",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: availableSizeList
                        .asMap()
                        .map((index, value) => MapEntry(
                              index,
                              GestureDetector(
                                onTap: () {
                                  availableSizeSelectIndex = index;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    height: 30,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: availableSizeSelectIndex == index
                                          ? Color(0xff3150FE)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Color(0xff000000)),
                                    ),
                                    child: Center(
                                        child: Text(value,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    availableSizeSelectIndex ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.black))),
                                  ),
                                ),
                              ),
                            ))
                        .values
                        .toList(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Select Shape",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Row(
                  children: list
                      .asMap()
                      .map((index, value) => MapEntry(
                            index,
                            GestureDetector(
                              onTap: () {
                                selectIndex = index;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 33,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    color: selectIndex == index
                                        ? Color(0xff3150FE)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Color(0xff000000)),
                                  ),
                                  child: Center(
                                      child: Text(value,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: selectIndex == index
                                                  ? Colors.white
                                                  : Colors.black))),
                                ),
                              ),
                            ),
                          ))
                      .values
                      .toList(),
                ),
                SizedBox(height: 20),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Text(
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and Read more",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "sold By : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Urban Farmer",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.kPrimaryGreen),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FREE delivery :",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff4996D1)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Saturday, 03 December 2022",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Divider(thickness: 1),
                SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (quantityIndex <= 0) {
                        } else {
                          quantityIndex = quantityIndex - 1;
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.remove, size: 16),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      quantityIndex.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        quantityIndex = quantityIndex + 1;
                        setState(() {});
                      },
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 16),
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: submitButton(
                        "Add to Cart",
                        () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(CartScreen.routeName),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

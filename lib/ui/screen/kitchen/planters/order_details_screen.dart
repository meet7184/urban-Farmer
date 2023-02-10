import 'package:flutter/material.dart';
import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';
import '../../../widget/back_button.dart';
import 'order_detailed_preview_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String routeName = "/orderDetailsScreen";
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<String> availableSizeList = ["18''", "20''", "22''"];
  int availableSizeSelectIndex = 1;
  int quantityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 320,
                    width: double.infinity,
                    child:
                        Image.asset(AppAssets.vegetableImage, fit: BoxFit.fill),
                  ),
                  Positioned(
                      right: 20,
                      bottom: 20,
                      child: Image.asset(
                        AppAssets.bookImage,
                        height: 20,
                        color: Colors.white,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Lorem Ipsum is that",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Size : 20",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      height: 46,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: availableSizeSelectIndex == index
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color(0xff000000)),
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
                    SizedBox(height: 20),
                    Text(
                      "Quantity",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantityIndex <= 0) {
                            } else {
                              quantityIndex = quantityIndex - 1;
                              setState(() {});
                            }
                          },
                          icon: Icon(Icons.remove, size: 24),
                        ),
                        SizedBox(width: 10),
                        Text(
                          quantityIndex.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            quantityIndex = quantityIndex + 1;
                            setState(() {});
                          },
                          icon: Icon(Icons.add, size: 24),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Lorem Ipsum is that it has a more-or-less ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    SizedBox(height: 15),
                    Divider(thickness: 1.5),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "Total : 2100",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(PlantersPreviewScreen.routeName);
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: AppColor.kPrimaryGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: EdgeInsets.only(right: 15, top: 30),
        child: Row(
          children: [
            CommonBackButton(),
            Expanded(
              child: Center(
                child: Text(
                  "Planters",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

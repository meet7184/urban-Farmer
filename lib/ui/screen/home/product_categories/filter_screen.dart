import 'package:flutter/material.dart';

import '../../../widget/back_button.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filterScreen";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<String> list = [
    "Size",
    "Color",
    "Brand",
    "Categories",
    "Country of Origin",
    "More Filters",
    "More Filters",
    "Price Range",
    "Discount",
    "Delivery Time"
  ];
  int selectIndex = 0;
  List<SizeModel> sizeList = [
    const SizeModel("UK6", "107"),
    const SizeModel("UK7", "111"),
    const SizeModel("UK8", "97"),
    const SizeModel("UK9", "103"),
    const SizeModel("UK10", "55"),
    const SizeModel("UK11", "35"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonBackButton(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filters",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "CLEAR ALL",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1.5),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          width: 183,
                          color: Colors.grey.shade300,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              ...list
                                  .asMap()
                                  .map((index, value) => MapEntry(
                                      index,
                                      GestureDetector(
                                        onTap: () {
                                          selectIndex = index;
                                          setState(() {});
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 183,
                                              //margin: EdgeInsets.only(bottom: 10),
                                              color: selectIndex == index
                                                  ? Colors.white
                                                  : Colors.grey.shade300,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 5),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          selectIndex == index
                                                              ? Colors.black
                                                              : Colors.black54),
                                                ),
                                              ),
                                            ),
                                            Divider(thickness: 1),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...sizeList
                          .asMap()
                          .map((key, value) => MapEntry(
                              key,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.done,
                                        color: Colors.black45, size: 22),
                                    SizedBox(width: 5),
                                    Text(
                                      value.text,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black45),
                                    ),
                                    SizedBox(width: 30),
                                    Text(
                                      value.size,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black45),
                                    ),
                                  ],
                                ),
                              )))
                          .values
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SizeModel {
  final String text;
  final String size;

  const SizeModel(this.text, this.size);
}

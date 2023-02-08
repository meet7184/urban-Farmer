import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:urban_farmer/const/app_color.dart';

import '../../../../const/app_icon.dart';
import '../../../widget/back_button.dart';
import 'corporate_details_screen.dart';

class CorporateGiftsScreen extends StatefulWidget {
  static const String routeName = "/corporateGiftsScreen";
  const CorporateGiftsScreen({Key? key}) : super(key: key);

  @override
  State<CorporateGiftsScreen> createState() => _CorporateGiftsScreenState();
}

class _CorporateGiftsScreenState extends State<CorporateGiftsScreen> {
  List<String> list = ["Colleagues", "Employees", "Co"];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Who do Ypu Want",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  Text(
                    "make happy ?",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: AppColor.kPrimaryGreen),
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
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    height: 36,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: selectIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.grey),
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
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffF4F6F6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(height: 3, width: 80, color: Colors.black),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            "Popular Gifts",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: AppColor.kPrimaryGreen),
                          ),
                          Spacer(),
                          Container(
                            height: 38,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xffFF4953),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Filters",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: AlignedGridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(
                                            CorporateDetailsScreen.routeName);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 170,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                                AppAssets.foodImage,
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Lorem",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17),
                                              ),
                                              Spacer(),
                                              Text(
                                                "Rs. 280",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(45),
      child: Padding(
        padding: EdgeInsets.only(top: 25, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonBackButton(),
            CircleAvatar(
              backgroundImage: AssetImage(AppAssets.user),
              radius: 19,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../widget/app_bar.dart';

class MyCouponsScreen extends StatelessWidget {
  static const String routeName = "/myCouponsScreen";
  const MyCouponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTextAppBar("My Coupons"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (con, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black38),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      "150\nOFF",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 23,
                                          color: Colors.green),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "On minimum purchase of ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.black38),
                                          ),
                                          SizedBox(height: 7),
                                          Row(
                                            children: [
                                              Text(
                                                "Code: ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black38),
                                              ),
                                              Text(
                                                "MCFEXTRA150",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Rs. 900",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                Divider(thickness: 1.5),
                                ExpansionTile(
                                  //collapsedTextColor: Colors.black38,
                                  title: Row(
                                    children: [
                                      Text(
                                        "Expiry: ",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        "FEB 13 2023  11:59:00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: CircleAvatar(
                                                    radius: 4,
                                                    backgroundColor:
                                                        Colors.black),
                                              ),
                                              SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                  "Rs. 150 off on minimum purchase of Rs. 900",
                                                  //overflow: TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                  radius: 4,
                                                  backgroundColor:
                                                      Colors.black),
                                              SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                  "Maximum applicable discount of 70.0%",
                                                  //overflow: TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
    );
  }
}

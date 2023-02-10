import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/widget/app_bar.dart';

import '../../../const/app_icon.dart';
import '../../widget/back_button.dart';
import '../../widget/container_submit_textfield_widget.dart';
import '../kitchen/detail_kitchengarden_screen.dart';
import '../kitchen/services_category_screen.dart';
import '../kitchen/widget/dropdown_button.dart';

class GardenMaintenanceScreen extends StatefulWidget {
  static const String routeName = "/gardenMaintenanceScreen";
  const GardenMaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<GardenMaintenanceScreen> createState() =>
      _GardenMaintenanceScreenState();
}

class _GardenMaintenanceScreenState extends State<GardenMaintenanceScreen> {
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();

  String? selected2;
  List<String> list = [
    "1 Quarterly",
    "2 Quarterly",
    "3 Quarterly",
    "4 Quarterly",
    "5 Quarterly",
    "6 Quarterly"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTextAppBar("Ask for Gardener’s Visit"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Image.asset(AppAssets.serviceScreenImage),
                  ),
                  Positioned(
                      top: 100,
                      right: 0,
                      child: Image.asset(AppAssets.serviceScreenImage3,
                          height: 30)),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                            child: Text(
                          "Area : 00 Sq ft.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: containerBoxShadowWidget(Column(
                        children: [
                          submitTextField("Length : ", lengthController),
                          SizedBox(height: 10),
                          submitTextField("Width : ", widthController),
                          SizedBox(height: 30),
                        ],
                      )),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CommonDropdownButton(
                        title: "No. of existing plants",
                        items: list,
                        select: selected2,
                        onChangeValue: (val) {
                          selected2 = val;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ...List.generate(
                4,
                (index) => Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Starter Farm",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff999999)),
                              ),
                              SizedBox(height: 17),
                              Row(
                                children: [
                                  Text(
                                    "2499/-",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.kPrimaryGreen),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "Quarterly",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                "For 100 Sqft.",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4996D1),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                          Spacer(),
                          Image.asset(AppAssets.forgotScreenImag, height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 6,
                        )
                      ],
                      color: AppColor.kPrimaryGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

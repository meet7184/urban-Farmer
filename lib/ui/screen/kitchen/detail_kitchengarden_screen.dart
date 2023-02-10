import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/ui/screen/kitchen/services_category_screen.dart';

import '../../../const/app_icon.dart';
import '../../widget/app_bar.dart';
import '../../widget/back_button.dart';
import '../../widget/container_submit_textfield_widget.dart';
import 'kitchen_order/kitchen_orde_screen.dart';

class DetailKitchenGardenScreen extends StatefulWidget {
  static const String routeName = 'detailKitchenScreen';
  const DetailKitchenGardenScreen({Key? key}) : super(key: key);

  @override
  State<DetailKitchenGardenScreen> createState() =>
      _DetailKitchenGardenScreenState();
}

class _DetailKitchenGardenScreenState extends State<DetailKitchenGardenScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController houseController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController facingController = TextEditingController();
  TextEditingController gerdenModelController = TextEditingController();
  TextEditingController noOfModelController = TextEditingController();
  late TabController tabController;
  String? selected;
  List<KitchenCountry> dropdownList = [
    KitchenCountry(title: "Small", sqFt: "Upto 100 Sq ft."),
    KitchenCountry(title: "Medium", sqFt: "Upto 200 Sq ft."),
    KitchenCountry(title: "Large", sqFt: "Upto 300 Sq ft."),
    KitchenCountry(title: "Extended Farm", sqFt: "300 Sq ft. & Above"),
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTextAppBar("Kitchen Garden"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Self details to be filled :",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
                ),
                SizedBox(height: 30),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Image.asset(AppAssets.serviceScreenImage),
                    ),
                    Column(
                      children: [
                        containerBoxShadowWidget(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              submitTextField("House Type : ", houseController),
                              SizedBox(height: 10),
                              submitTextField(
                                  "Building Format : ", buildingController),
                              SizedBox(height: 10),
                              submitTextField("Floor : ", floorController),
                              SizedBox(height: 10),
                              submitTextField(
                                  "House Facing : ", facingController),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        DropdownButtonHideUnderline(
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 6),
                                ]),
                            child: DropdownButton2(
                              hint: Center(
                                child: Text(
                                  '- Select your Area',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              icon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.keyboard_arrow_down_outlined),
                              ),
                              items: dropdownList
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item.sqFt,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                SizedBox(width: 20),
                                                SizedBox(
                                                  width: 80,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: Text(
                                                      item.title,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 30),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Text(
                                                    item.sqFt,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                              thickness: 1, color: Colors.grey),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: selected,
                              onChanged: (value) {
                                // print("===> ${value}");
                                selected = value as String;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        containerBoxShadowWidget(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              submitTextField(
                                  "Gerden Model : ", gerdenModelController),
                              SizedBox(height: 15),
                              submitTextField(
                                  "No. of Planters : ", noOfModelController),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.kPrimaryGreen),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3), blurRadius: 5),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "What do you wish to grow",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColor.kPrimaryGreen),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: submitButton(
                    "Next",
                    () => Navigator.of(context, rootNavigator: true)
                        .pushNamed(KitchenOrderScreen.routeName),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

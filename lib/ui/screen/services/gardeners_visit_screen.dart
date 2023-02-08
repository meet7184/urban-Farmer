import 'package:flutter/material.dart';

import '../../../const/app_color.dart';
import '../../widget/back_button.dart';
import '../../widget/common_text_field.dart';

class GardenersVisitScreen extends StatefulWidget {
  static const String routeName = 'gardenersVisitScreen';
  const GardenersVisitScreen({Key? key}) : super(key: key);

  @override
  State<GardenersVisitScreen> createState() => _GardenersVisitScreenState();
}

class _GardenersVisitScreenState extends State<GardenersVisitScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Lorem Ipsum is that it has a more-or-less",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
                ),
                SizedBox(height: 10),
                Text(
                  "You can reach us anytime viahi@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 21),
                ),
                SizedBox(height: 30),
                getTitle("Name"),
                SizedBox(height: 10),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.firstName,
                  textEditingController: firstNameController,
                ),
                SizedBox(height: 30),
                getTitle("Mobile Number"),
                SizedBox(height: 10),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.firstName,
                  textEditingController: firstNameController,
                ),
                SizedBox(height: 20),
                getTitle("Address"),
                SizedBox(height: 10),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.address,
                  textEditingController: addressController,
                ),
                SizedBox(height: 30),
                getTitle("Date & Time of Visit"),
                SizedBox(height: 50),
                getTitle("Inclusions : "),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inclusionsText("1. Home Visit"),
                      inclusionsText("2. Area Measurement"),
                      inclusionsText("3. Requirement Mapping"),
                      inclusionsText("4. 5 Kg Organic Manure"),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.kPrimaryGreen,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        "Make Payment",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
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

  Widget getTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
    );
  }

  Widget inclusionsText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 30),
        child: Row(
          children: [
            CommonBackButton(),
            Expanded(
              child: Center(
                child: Text(
                  "Ask for Gardener’s Visit",
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

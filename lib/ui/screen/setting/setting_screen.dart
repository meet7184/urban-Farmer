import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';

import '../../widget/back_button.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "/settingsScreen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;

  List<String> list = ["Feedback", "Notifications", "Feedback"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Spacer(),
                  Switch(
                    value: isSwitched,
                    activeColor: Color(0xff417D60),
                    activeTrackColor: Color(0xffC7C7C7),
                    onChanged: (bool a) {
                      isSwitched = a;
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 2),
              ...list
                  .asMap()
                  .map((index, value) => MapEntry(
                      index,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          value,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      )))
                  .values
                  .toList(),
              Spacer(),
              Divider(thickness: 1.5),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.deleteImage, height: 24),
                  SizedBox(width: 20),
                  Text(
                    "Delete Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
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
                  "Setting",
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

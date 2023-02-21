import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/profile/profile_screen.dart';

import '../../widget/app_bar.dart';
import '../../widget/back_button.dart';
import '../../widget/common_text_field.dart';

class ProfileEditScreen extends StatefulWidget {
  static const String routeName = "/profileEditScreen";
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTextAppBar("Edit Profile"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 40),
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: Center(
                        child: Icon(Icons.camera_alt_outlined,
                            color: Colors.white, size: 60)),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Edit Profile",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(height: 40),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.firstNameEdit,
                  textEditingController: firstNameController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.lastNameEdit,
                  textEditingController: lastNameController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.phoneNumberEdit,
                  textEditingController: phoneNumberController,
                ),
                SizedBox(height: 5),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.emailEdit,
                  textEditingController: emailIdController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  textFieldType: TextFieldType.addressEdit,
                  textEditingController: addressController,
                ),
                SizedBox(height: 40),
                submitButton(
                  "Save",
                  () => Navigator.pushNamed(context, ProfileScreen.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/login/sign_in_screen.dart';

import '../../widget/common_text_field.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController emailPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  cancelButton(),
                  SizedBox(height: 15),
                  Image.asset(AppAssets.appLogo, height: 90),
                  SizedBox(height: 10),
                  Text(
                    "Join us",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Discover your perfect garden",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.kTextColor,
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.userName,
                    textEditingController: userNameController,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.phoneNumber,
                    textEditingController: phoneNumberController,
                  ),
                  SizedBox(height: 5),
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.emailId,
                    textEditingController: emailIdController,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.emailPassword,
                    textEditingController: emailPasswordController,
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                            "By Signing up, you agree to our Terms & Conditions and Privacy Policy",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13)),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(SignInScreen.routeName);
                    },
                    child: Container(
                      height: 45,
                      width: 270,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 6,
                          )
                        ],
                        color: AppColor.kPrimaryGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Image.asset(
                            AppAssets.userImage,
                            height: 18,
                            width: 22,
                          )),
                          SizedBox(width: 15),
                          Text(
                            "Join us",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account? ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: Text(
                          "LogIn",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color(0xff3871C2)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget cancelButton() {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Text(
          "cancel",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColor.kTextColor,
          ),
        ),
      ),
      Spacer(),
      Container(),
    ],
  );
}

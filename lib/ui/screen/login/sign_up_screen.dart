import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/core/utils/flitter_toast.dart';
import 'package:urban_farmer/ui/screen/login/controller/sign_up_controller.dart';
import 'package:urban_farmer/ui/screen/login/sign_in_screen.dart';
import 'package:urban_farmer/ui/screen/login/sign_up_verification.dart';
import '../../../core/network/utils/base_response.dart';
import '../../widget/common_text_field.dart';
import '../../widget/phone_number_textfield.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSelectIndex = true;
  bool hidePassword = true;
  bool hidePassword2 = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignUpController controller = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GetBuilder(
                builder: (SignUpController controller) {
                  return SingleChildScrollView(
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
                          textEditingController: controller.userNameController,
                        ),
                        SizedBox(height: 20),
                        MobileNumberField(
                            controller: controller.phoneNumberController),
                        SizedBox(height: 5),
                        CustomTextField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          textFieldType: TextFieldType.emailId,
                          textEditingController: controller.emailIdController,
                          obscureText: hidePassword,
                          suffixIcon: IconButton(
                            icon: hidePassword
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.kTextColor,
                                    size: 21,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: AppColor.kTextColor,
                                    size: 21,
                                  ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          textFieldType: TextFieldType.city,
                          textEditingController: controller.cityController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          textFieldType: TextFieldType.state,
                          textEditingController: controller.stateController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          textFieldType: TextFieldType.addressEdit,
                          textEditingController: controller.addressController,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          textFieldType: TextFieldType.zipcode,
                          textEditingController: controller.zipcodeController,
                        ),
                        SizedBox(height: 5),
                        CustomTextField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          textFieldType: TextFieldType.emailPassword,
                          textEditingController: controller.passwordController,
                          obscureText: hidePassword2,
                          suffixIcon: IconButton(
                            icon: hidePassword2
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.kTextColor,
                                    size: 21,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: AppColor.kTextColor,
                                    size: 21,
                                  ),
                            onPressed: () {
                              setState(() {
                                hidePassword2 = !hidePassword2;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                isSelectIndex = !isSelectIndex;
                                setState(() {});
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                child: isSelectIndex
                                    ? Center(
                                        child: Icon(Icons.done,
                                            color: Colors.white, size: 18),
                                      )
                                    : Icon(Icons.done,
                                        color: Colors.black, size: 18),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                  "By Signing up, you agree to our Terms & Conditions and Privacy Policy",
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13)),
                            ),
                          ],
                        ),
                        SizedBox(height: 35),
                        GestureDetector(
                          onTap: () async {
                            disposeKeyboard();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context.loaderOverlay.show();
                              final response = await controller.signUp();
                              context.loaderOverlay.hide();
                              response.when(
                                success: (data) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(
                                          SignUpVerificationScreen.routeName);
                                },
                                failure: (ErrorType type, String? message) {
                                  showToast(getMessageFromErrorType(type));
                                },
                              );
                            }
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
                                Navigator.pushNamed(
                                    context, SignInScreen.routeName);
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
                  );
                },
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

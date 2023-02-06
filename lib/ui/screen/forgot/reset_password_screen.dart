import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';

import '../../../const/app_color.dart';
import '../../widget/common_text_field.dart';
import '../login/sign_in_screen.dart';
import '../login/sign_up_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/resetPasswordScreen';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      cancelButton(),
                      SizedBox(height: 30),
                      Center(
                        child: Text(
                          "Reset \n Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomTextField(
                        validator: (val) =>
                            val!.trim().isEmpty ? "field required" : null,
                        textFieldType: TextFieldType.newPassword,
                        textEditingController: newPasswordController,
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        validator: (val) =>
                            val!.trim().isEmpty ? "field required" : null,
                        textFieldType: TextFieldType.confirmPassword,
                        textEditingController: confirmPasswordController,
                      ),
                      SizedBox(height: 40),
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
                          child: Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Resend",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColor.kTextColor),
                      ),
                    ],
                  ),
                ),
                Image.asset(AppAssets.resetPasswordImag),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

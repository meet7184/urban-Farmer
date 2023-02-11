import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/dashboad/dashboard_screen.dart';

import '../../../const/app_color.dart';
import '../../widget/back_button.dart';
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
                    submitButton(
                      "Submit",
                      () => Navigator.of(context, rootNavigator: true)
                          .pushNamed(DashBoardScreen.routeName),
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
              Spacer(),
              Image.asset(AppAssets.resetPasswordImag, height: 320),
            ],
          ),
        ),
      ),
    );
  }
}

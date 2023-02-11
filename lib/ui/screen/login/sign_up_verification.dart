import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/dashboad/dashboard_screen.dart';
import 'package:urban_farmer/ui/screen/forgot/reset_password_screen.dart';
import 'package:urban_farmer/ui/screen/login/sign_in_screen.dart';
import 'package:urban_farmer/ui/widget/otp_text_field.dart';
import '../../../const/app_color.dart';
import '../../widget/back_button.dart';
import '../login/sign_up_screen.dart';

class SignUpVerificationScreen extends StatefulWidget {
  static const String routeName = '/signUpVerificationScreen';
  const SignUpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<SignUpVerificationScreen> createState() =>
      _SignUpVerificationScreenState();
}

class _SignUpVerificationScreenState extends State<SignUpVerificationScreen> {
  TextEditingController signUpVerificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          disposeKeyboard();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                          "Enter Otp",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "A 4 digit code has been \n sent to **9876",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColor.kTextColor,
                        ),
                      ),
                      SizedBox(height: 40),
                      OtpTextField(controller: signUpVerificationController),
                      const SizedBox(height: 40),
                      submitButton(
                        "Submit",
                        () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(SignInScreen.routeName),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            color: AppColor.kTextColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Spacer(),
                Image.asset(AppAssets.otpImag, height: 300),
              ],
            ),
          ),
        ));
  }
}

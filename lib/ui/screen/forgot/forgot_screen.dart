import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import '../../../const/app_color.dart';
import '../../widget/back_button.dart';
import '../../widget/common_text_field.dart';
import '../login/sign_up_screen.dart';
import 'otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgotPasswordScreen';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailIdController = TextEditingController();
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
                        "Forgot \n Password ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here'",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColor.kTextColor,
                      ),
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      validator: (val) =>
                          val!.trim().isEmpty ? "field required" : null,
                      textFieldType: TextFieldType.enterUserName,
                      textEditingController: emailIdController,
                    ),
                    SizedBox(height: 40),
                    submitButton(
                      "Submit",
                      () => Navigator.of(context, rootNavigator: true)
                          .pushNamed(OtpVerificationScreen.routeName),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(),
                  Spacer(),
                  Image.asset(
                    AppAssets.forgotScreenImag,
                    height: 260,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

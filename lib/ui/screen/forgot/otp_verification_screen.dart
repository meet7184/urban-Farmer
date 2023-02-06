import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/forgot/reset_password_screen.dart';
import '../../../const/app_color.dart';
import '../login/sign_up_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const String routeName = '/otpVerificationScreen';
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
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
                        PinCodeTextField(
                          textStyle: TextStyle(color: Colors.white),
                          appContext: context,
                          length: 4,
                          animationType: AnimationType.scale,
                          pastedTextStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          pinTheme: PinTheme(
                            activeColor: AppColor.kPrimaryGreen,
                            inactiveColor: AppColor.kPrimaryGreen,
                            inactiveFillColor: AppColor.kPrimaryGreen,
                            selectedFillColor: AppColor.kPrimaryGreen,
                            activeFillColor: AppColor.kPrimaryGreen,
                            selectedColor: AppColor.kPrimaryGreen,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 70,
                            fieldOuterPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            fieldWidth: 55,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          controller: otpController,
                          onChanged: (otp) {},
                          keyboardType: TextInputType.number,
                          enableActiveFill: true,
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(ResetPasswordScreen.routeName);
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
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              color: AppColor.kTextColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Image.asset(AppAssets.otpImag),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/forgot/controller/forgot_contoller.dart';
import 'package:urban_farmer/ui/screen/forgot/reset_password_screen.dart';
import '../../../const/app_color.dart';
import '../../../core/network/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../../widget/otp_text_field.dart';
import '../login/sign_up_screen.dart';

class ForgotOtpVerificationScreen extends StatefulWidget {
  static const String routeName = '/forgotOtpVerificationScreen';
  const ForgotOtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<ForgotOtpVerificationScreen> createState() =>
      _ForgotOtpVerificationScreenState();
}

class _ForgotOtpVerificationScreenState
    extends State<ForgotOtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          disposeKeyboard();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: GetBuilder(
              builder: (ForgotController controller) {
                return Column(
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
                          OtpTextField(controller: otpController),
                          const SizedBox(height: 40),
                          GestureDetector(
                            onTap: () async {
                              if (otpController.text.length == 4) {
                                context.loaderOverlay.show();
                                final response =
                                    await controller.forgotOtpVerification(
                                        otpController.text.trim());
                                context.loaderOverlay.hide();
                                response.when(
                                  success: (data) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(
                                            ResetPasswordScreen.routeName);
                                  },
                                  failure: (ErrorType type, String? message) {
                                    showToast(getMessageFromErrorType(type));
                                  },
                                );
                              } else {
                                showToast("please enter otp");
                              }
                            },
                            child: Container(
                              height: 45,
                              width: 260,
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
                    Spacer(),
                    Image.asset(AppAssets.otpImag, height: 283),
                  ],
                );
              },
            ),
          ),
        ));
  }
}

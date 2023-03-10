import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/forgot/controller/forgot_contoller.dart';
import '../../../const/app_color.dart';
import '../../../core/network/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../../widget/back_button.dart';
import '../../widget/common_text_field.dart';
import '../../widget/phone_number_textfield.dart';
import '../login/sign_up_screen.dart';
import 'forgot_otp_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgotPasswordScreen';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: SafeArea(
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
                          MobileNumberField(
                              controller: controller.phoneNumberController),
                          SizedBox(height: 40),
                          GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context.loaderOverlay.show();
                                final response = await controller.forgot();
                                context.loaderOverlay.hide();
                                response.when(
                                  success: (data) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(ForgotOtpVerificationScreen
                                            .routeName);
                                  },
                                  failure: (ErrorType type, String? message) {
                                    showToast(getMessageFromErrorType(type));
                                  },
                                );
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

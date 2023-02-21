import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import '../../../const/app_color.dart';
import '../../../core/network/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../../widget/common_text_field.dart';
import '../login/sign_in_screen.dart';
import '../login/sign_up_screen.dart';
import 'controller/forgot_contoller.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/resetPasswordScreen';
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool hidePassword = true;
  bool hidePassword2 = true;
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
                            validator: (val) => val!.trim().isEmpty
                                ? "field required"
                                : val.trim() ==
                                        newPasswordController.text.trim()
                                    ? null
                                    : "password not match",
                            textFieldType: TextFieldType.confirmPassword,
                            textEditingController: confirmPasswordController,
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
                          SizedBox(height: 40),
                          GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context.loaderOverlay.show();
                                final response =
                                    await controller.getResetPassword(
                                        newPasswordController.text.trim());
                                context.loaderOverlay.hide();
                                response.when(
                                  success: (data) {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(SignInScreen.routeName);
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
                    Container(
                        height: 240,
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Image.asset(
                          AppAssets.resetPasswordImag,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(height: 1),
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

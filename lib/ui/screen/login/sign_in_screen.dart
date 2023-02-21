import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/login/controller/login_controller.dart';
import 'package:urban_farmer/ui/screen/login/sign_in_verification.dart';
import 'package:urban_farmer/ui/screen/login/sign_up_screen.dart';

import '../../../const/app_color.dart';
import '../../../core/network/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../../widget/back_button.dart';
import '../../widget/common_text_field.dart';
import '../../widget/phone_number_textfield.dart';
import '../dashboad/dashboard_screen.dart';
import '../forgot/forgot_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool hidePassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GetBuilder(
                builder: (LoginController controller) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        cancelButton(),
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            "Hello Again!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Wellcome back you’ve \n been missed!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColor.kTextColor,
                          ),
                        ),
                        SizedBox(height: 45),
                        MobileNumberField(
                            controller: controller.phoneNumberController),
                        SizedBox(height: 10),
                        CustomTextField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          textFieldType: TextFieldType.emailPassword,
                          textEditingController: controller.passwordController,
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
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Container(),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ForgotPasswordScreen.routeName);
                              },
                              child: Text(
                                "Recover Password",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.kTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        GestureDetector(
                          onTap: () async {
                            disposeKeyboard();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context.loaderOverlay.show();
                              final response = await controller.login();
                              context.loaderOverlay.hide();
                              response.when(
                                success: (data) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(
                                          SignInVerificationScreen.routeName);
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
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 60),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Color(0xffD2D2D2),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Or Continue with",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColor.kTextColor,
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                height: 2,
                                color: Color(0xffD2D2D2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getShadowBox(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  AppAssets.googleImage,
                                  height: 20,
                                  width: 20,
                                ),
                              )),
                              getShadowBox(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  AppAssets.appleImage,
                                  height: 20,
                                  width: 20,
                                ),
                              )),
                              getShadowBox(Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  AppAssets.facebookImage,
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Not a member? ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17)),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed(SignUpScreen.routeName);
                              },
                              child: Text(
                                "Register now",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Color(0xff3871C2)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
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

  Widget getShadowBox(Widget child) {
    return Container(
      height: 45,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffD2D2D2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

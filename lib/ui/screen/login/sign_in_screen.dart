import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';
import 'package:urban_farmer/ui/screen/login/sign_up_screen.dart';

import '../../../const/app_color.dart';
import '../../widget/back_button.dart';
import '../../widget/common_text_field.dart';
import '../dashboad/dashboard_screen.dart';
import '../forgot/forgot_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController emailPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
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
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.enterUserName,
                    textEditingController: emailIdController,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.emailPassword,
                    textEditingController: emailPasswordController,
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
                  submitButton(
                    "Sign In",
                    () => Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName),
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
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
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

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../const/app_color.dart';

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;
  const OtpTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 15),
        fieldWidth: 55,
      ),
      animationDuration: const Duration(milliseconds: 300),
      controller: controller,
      onChanged: (otp) {},
      keyboardType: TextInputType.number,
      enableActiveFill: true,
    );
  }
}

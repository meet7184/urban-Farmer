import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';

import '../../const/app_color.dart';

enum TextFieldType {
  userName,
  phoneNumber,
  emailId,
  emailPassword,
  enterUserName,
  newPassword,
  confirmPassword,
  firstName,
  address,
}

class CustomTextField extends StatelessWidget {
  final TextFieldType textFieldType;
  final TextEditingController? textEditingController;
  final Widget? clearTextWidget;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    this.validator,
    this.textEditingController,
    required this.textFieldType,
    this.clearTextWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: AppColor.kTextColor,
          fontSize: 15,
          fontWeight: FontWeight.w700),
      textAlignVertical: TextAlignVertical.center,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: textEditingController,
      validator:
          validator ?? (val) => val!.trim().isEmpty ? "field required" : null,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.black38),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.black38),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(17),
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
      ),
    );
  }

  int? get maxLines {
    switch (textFieldType) {
      case TextFieldType.address:
        return 5;
    }
    return null;
  }

  int? get maxLength {
    switch (textFieldType) {
      case TextFieldType.phoneNumber:
        return 10;
    }
    return null;
  }

  TextInputType? get textInputType {
    switch (textFieldType) {
      case TextFieldType.phoneNumber:
        return TextInputType.number;
    }
    return null;
  }

  TextInputAction? get textInputAction {
    switch (textFieldType) {
      case TextFieldType.userName:
      case TextFieldType.phoneNumber:
      case TextFieldType.emailPassword:
      case TextFieldType.emailId:
      case TextFieldType.enterUserName:
      case TextFieldType.newPassword:
      case TextFieldType.confirmPassword:
      case TextFieldType.firstName:
        return TextInputAction.next;
      default:
        return null;
    }
  }

  Widget? get prefix {
    switch (textFieldType) {
      case TextFieldType.newPassword:
      case TextFieldType.confirmPassword:
        return Icon(
          Icons.lock,
        );
      default:
        return null;
    }
  }

  Widget? get suffix {
    switch (textFieldType) {
      case TextFieldType.phoneNumber:
      case TextFieldType.emailId:
      case TextFieldType.emailPassword:
      case TextFieldType.newPassword:
      case TextFieldType.confirmPassword:
        return Icon(
          Icons.visibility_outlined,
          color: AppColor.kTextColor,
          size: 21,
        );
      default:
        return null;
    }
  }

  String? get hintText {
    switch (textFieldType) {
      case TextFieldType.userName:
        return "Name";
      case TextFieldType.phoneNumber:
        return "Contact";
      case TextFieldType.emailId:
        return "Email";
      case TextFieldType.emailPassword:
        return "Password";
      case TextFieldType.enterUserName:
        return "Enter username";
      case TextFieldType.newPassword:
        return "New Password";
      case TextFieldType.confirmPassword:
        return "Confirm Password";
      case TextFieldType.firstName:
        return "First Name";
      default:
        return null;
    }
  }
}

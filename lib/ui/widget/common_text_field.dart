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
  firstNameEdit,
  lastNameEdit,
  phoneNumberEdit,
  emailEdit,
  addressEdit,
  city,
  addressField,
  state,
  zipcode,
  name2,
  phoneNumber2,
  emailEdit2,
  addressEdit2,
  city2,
  addressField2,
  state2,
  zipcode2,
}

class CustomTextField extends StatelessWidget {
  final TextFieldType textFieldType;
  final TextEditingController? textEditingController;
  final Widget? clearTextWidget;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  const CustomTextField({
    Key? key,
    this.validator,
    this.textEditingController,
    required this.textFieldType,
    this.clearTextWidget,
    this.obscureText = false,
    this.suffixIcon,
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
      obscureText: obscureText,
      maxLines: maxLines,
      controller: textEditingController,
      validator:
          validator ?? (val) => val!.trim().isEmpty ? "field required" : null,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedErrorBorder: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.black38),
        ),
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
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }

  int? get maxLines {
    switch (textFieldType) {
      case TextFieldType.address:
        return 5;
    }
    return 1;
  }

  int? get maxLength {
    switch (textFieldType) {
      case TextFieldType.phoneNumber:
      case TextFieldType.phoneNumberEdit:
      case TextFieldType.phoneNumber2:
        return 10;
      case TextFieldType.zipcode:
      case TextFieldType.zipcode2:
        return 6;
    }
    return null;
  }

  TextInputType? get textInputType {
    switch (textFieldType) {
      case TextFieldType.phoneNumber:
      case TextFieldType.phoneNumberEdit:
      case TextFieldType.zipcode:
      case TextFieldType.zipcode2:
      case TextFieldType.phoneNumber2:
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
      case TextFieldType.firstNameEdit:
      case TextFieldType.lastNameEdit:
      case TextFieldType.emailEdit:
      case TextFieldType.addressEdit:
      case TextFieldType.phoneNumberEdit:
      case TextFieldType.city:
      case TextFieldType.state:
      case TextFieldType.zipcode:
      case TextFieldType.name2:
      case TextFieldType.emailEdit2:
      case TextFieldType.addressEdit2:
      case TextFieldType.phoneNumber2:
      case TextFieldType.city2:
      case TextFieldType.state2:
      case TextFieldType.zipcode2:
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
      case TextFieldType.firstNameEdit:
        return "First Name";
      case TextFieldType.lastNameEdit:
        return "Last Name";
      case TextFieldType.phoneNumberEdit:
        return "Phone Number";
      case TextFieldType.emailEdit:
        return "Email Id";
      case TextFieldType.addressEdit:
        return "Address";
      case TextFieldType.city:
        return "City";
      case TextFieldType.state:
        return "State";
      case TextFieldType.zipcode:
        return "Zip Code";
      case TextFieldType.name2:
        return "Name*";
      case TextFieldType.emailEdit2:
        return "Email Address*";
      case TextFieldType.addressEdit2:
        return "Address (House no, Building, Street, Area)*";
      case TextFieldType.phoneNumber2:
        return "Mobile No*";
      case TextFieldType.city2:
        return "City / District*";
      case TextFieldType.state2:
        return "State*";
      case TextFieldType.zipcode2:
        return "Pin Code*";
      default:
        return null;
    }
  }
}

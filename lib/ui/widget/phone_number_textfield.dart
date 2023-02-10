import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class MobileNumberField extends StatelessWidget {
  final void Function(PhoneNumber)? onChanged;
  final void Function(Country)? onCountryChanged;
  const MobileNumberField({Key? key, this.onChanged, this.onCountryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: IntlPhoneField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: "98659 85689",
            hintStyle: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.w400,
                fontSize: 18),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black38)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black38)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.black38))),
        initialCountryCode: 'IN',
        dropdownTextStyle: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        style: TextStyle(
            color: context.iconColor,
            fontWeight: FontWeight.w400,
            fontSize: 18),
        onChanged: onChanged,
        showDropdownIcon: false,
        onCountryChanged: onCountryChanged,
        flagsButtonPadding: EdgeInsets.only(left: 20),
      ),
    );
  }
}

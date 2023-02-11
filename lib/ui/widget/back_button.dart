import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';

import '../../const/app_color.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Image.asset(
        AppAssets.arrowImage,
        height: 18,
      ),
    );
  }
}

Widget submitButton(String text, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40,
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
          text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    ),
  );
}

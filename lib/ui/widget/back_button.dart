import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';

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
        height: 20,
      ),
    );
  }
}

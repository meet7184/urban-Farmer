import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_icon.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

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

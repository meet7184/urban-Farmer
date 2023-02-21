import 'dart:developer';
import 'package:get/get.dart';
import 'package:urban_farmer/ui/screen/dashboad/dashboard_screen.dart';
import 'package:urban_farmer/ui/screen/splash/splash_screen.dart';
import 'app_controller.dart';

AppController appController = Get.find<AppController>();

String get getInitialRoute {
  if (appController.userModelData != null) {
    log("User Model ====> ${appController.userModelData!.userId}");
    return DashBoardScreen.routeName;
  } else {
    return SplashScreen.routeName;
  }
}

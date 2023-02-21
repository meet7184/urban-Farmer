import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/core/network/utils/error_util.dart';
import 'package:urban_farmer/core/utils/global.dart';
import 'package:urban_farmer/ui/ui_failure/ui_result.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/utils/app_prefs.dart';

class LoginController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UiFailure? uiFailure;

  Future<UiResult<bool>> login() async {
    try {
      await userRepo.login(
        phoneNumberController.text.trim(),
        passwordController.text.trim(),
      );
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> loginOtpVerification(String otp) async {
    try {
      final response = await userRepo.loginVerify(
        otp,
        phoneNumberController.text.trim(),
      );
      GetIt.I.get<AppPrefs>().setUser(response);
      print("=======================> ${response.userId}");
      print("===========> ${response.userId}");
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }
}

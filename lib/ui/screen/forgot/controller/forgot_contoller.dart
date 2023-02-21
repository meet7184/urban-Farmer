import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/core/network/utils/error_util.dart';
import 'package:urban_farmer/ui/ui_failure/ui_result.dart';
import '../../../../core/repository/user_repository.dart';

class ForgotController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController phoneNumberController = TextEditingController();

  UiFailure? uiFailure;

  Future<UiResult<bool>> forgot() async {
    try {
      await userRepo.forgotPassword(
        phoneNumberController.text.trim(),
      );
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> forgotOtpVerification(String otp) async {
    try {
      await userRepo.forgotVerify(
        otp,
        phoneNumberController.text.trim(),
      );
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> getResetPassword(String password) async {
    try {
      await userRepo.resetPassword(
        password,
        phoneNumberController.text.trim(),
      );
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }
}

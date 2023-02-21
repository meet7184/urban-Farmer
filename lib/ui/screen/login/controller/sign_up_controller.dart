import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/core/network/utils/error_util.dart';
import 'package:urban_farmer/ui/ui_failure/ui_result.dart';
import '../../../../core/repository/user_repository.dart';

class SignUpController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UiFailure? uiFailure;

  Future<UiResult<bool>> signUp() async {
    try {
      await userRepo.singUpAccount(
        userNameController.text.trim(),
        phoneNumberController.text.trim(),
        emailIdController.text.trim(),
        cityController.text.trim(),
        stateController.text.trim(),
        addressController.text.trim(),
        zipcodeController.text.trim(),
        passwordController.text.trim(),
      );
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> otpVerification(String otp) async {
    try {
      await userRepo.signUpVerify(
        otp,
        phoneNumberController.text.trim(),
      );
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }
}

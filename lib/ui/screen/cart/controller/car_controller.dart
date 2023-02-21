import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/core/network/utils/error_util.dart';
import 'package:urban_farmer/core/utils/global.dart';
import 'package:urban_farmer/ui/screen/cart/model/cart_model.dart';
import 'package:urban_farmer/ui/ui_failure/ui_result.dart';
import '../../../../core/repository/user_repository.dart';

class CartController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController phoneNumberController = TextEditingController();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<CartModelList> cartList = [];

  Future<UiResult<bool>> addCartList() async {
    try {
      isLoading = true;
      final response =
          await userRepo.cartViewList(appController.userModelData!.userId);
      cartList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onInit() {
    addCartList();
    super.onInit();
  }
}

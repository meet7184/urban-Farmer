import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/core/network/utils/error_util.dart';
import 'package:urban_farmer/core/utils/global.dart';
import 'package:urban_farmer/ui/screen/cart/model/order_history_model.dart';
import 'package:urban_farmer/ui/ui_failure/ui_result.dart';
import '../../../../core/repository/user_repository.dart';

class OrderHistoryController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<OrderHistoryList> orderList = [];

  Future<UiResult<bool>> orderHistoryList() async {
    try {
      isLoading = true;
      final response =
          await userRepo.orderHistory(appController.userModelData!.userId);
      orderList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onInit() {
    orderHistoryList();
    super.onInit();
  }
}

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/network/utils/error_util.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/utils/global.dart';
import '../../../ui_failure/ui_result.dart';
import '../model/products_details_model.dart';

class ProductsDetailsController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  UiFailure? uiFailure;

  ProductDataList? productList;
  Future<UiResult<bool>> getProductsDetails(String productId) async {
    try {
      isLoading = true;
      final response = await userRepo.productsDetails(productId);
      productList = response;
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  Future<UiResult<bool>> addCartList(
      String productId, String productQuantity, String productPrice) async {
    try {
      isLoading = true;
      await userRepo.addCart(appController.userModelData!.userId, productId,
          productQuantity, productPrice);
      print("====================> ${appController.userModelData}");
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onInit() {
    getProductsDetails(Get.arguments);
    super.onInit();
  }
}

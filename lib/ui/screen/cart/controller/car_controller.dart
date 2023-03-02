import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/core/network/utils/error_util.dart';
import 'package:urban_farmer/core/utils/global.dart';
import 'package:urban_farmer/ui/screen/cart/model/address_list_model.dart';
import 'package:urban_farmer/ui/screen/cart/model/cart_model.dart';
import 'package:urban_farmer/ui/ui_failure/ui_result.dart';
import '../../../../core/repository/user_repository.dart';
import '../model/count_model.dart';

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

  double get totalPrice => cartList.fold(
      0, (sum, item) => sum + (item.productsSalePrice * item.qty));

  void quntitiyPlus(int index) {
    cartList[index].qty += 1;
    update();
  }

  void quntityless(int index) {
    cartList[index].qty -= 1;
    update();
  }

  removeList(CartModelList cartModelList) {
    cartList.remove(cartModelList);
    update();
  }

  Future<UiResult<bool>> updateCart(
      String quantity, String userId, String productId) async {
    try {
      await userRepo.updateQuantityCart(quantity, userId, productId);
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  OrderCountModel? orderCountModel;
  // int? count;
  Future<UiResult<bool>> orderCount() async {
    try {
      isLoading = true;
      final response =
          await userRepo.cartOrderCount(appController.userModelData!.userId);
      // print("==================================> ${orderCountModel!.count}");
      orderCountModel = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  List<AddressListData> addressList = [];
  Future<UiResult<bool>> addAddressListData() async {
    try {
      isLoading = true;
      final response =
          await userRepo.addressList(appController.userModelData!.userId);
      addressList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<UiResult<bool>> getOrderPlace(
      String userId,
      String name,
      String mobileNumber,
      String email,
      String city,
      String state,
      String address,
      String zipCode) async {
    try {
      isLoading = true;
      final response = await userRepo.orderPlace(
          userId, name, mobileNumber, email, city, state, address, zipCode);
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  Future<UiResult<bool>> cartProductDelete(
      String userId, String productId) async {
    try {
      final response = await userRepo.cartProductRemove(userId, productId);
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  @override
  void onInit() {
    addCartList();
    orderCount();
    addAddressListData();
    super.onInit();
  }
}

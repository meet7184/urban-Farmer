import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/ui/screen/home/model/trending_products_model.dart';

import '../../../../core/network/utils/error_util.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../ui_failure/ui_result.dart';
import '../model/products_details_model.dart';

class ProductsController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  UiFailure? uiFailure;
  List<TrendingProductsList> trendingProductsList = [];
  Future<UiResult<bool>> trendingProducts() async {
    try {
      isLoading = true;
      final response = await userRepo.trendingProducts();
      trendingProductsList = response;
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  Future<UiResult<bool>> isFavorite(String userId, String productId) async {
    try {
      final response = await userRepo.favorite(userId, productId);
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> isFavoriteRemove(
      String userId, String productId) async {
    try {
      final response = await userRepo.favoriteRemove(userId, productId);
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  @override
  void onInit() {
    trendingProducts();
    super.onInit();
  }
}

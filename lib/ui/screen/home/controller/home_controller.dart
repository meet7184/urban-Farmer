import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/ui/screen/home/model/banner_model.dart';
import 'package:urban_farmer/ui/screen/home/model/services_model.dart';
import '../../../../core/network/utils/error_util.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../ui_failure/ui_result.dart';

class HomeController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<BannerListModel> bannerList = [];
  UiFailure? uiFailure;
  Future<UiResult<bool>> getBannerList() async {
    try {
      isLoading = true;
      final response = await userRepo.bannerCategory();
      bannerList = response;
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  List<ServicesList> servicesList = [];

  Future<UiResult<bool>> getServices() async {
    try {
      isLoading = true;
      final response = await userRepo.services();
      servicesList = response.data;
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onInit() {
    getBannerList();
    //getServices();
    super.onInit();
  }
}

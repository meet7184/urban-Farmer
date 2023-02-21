import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/network/utils/error_util.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../ui_failure/ui_result.dart';
import '../model/sub_category_model.dart';

class SubCategoryController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  UiFailure? uiFailure;

  List<SubCategoryList> subCategoryList = [];
  Future<UiResult<bool>> getSubCategory(String subCategoryId) async {
    try {
      isLoading = true;
      final response = await userRepo.subCategory(subCategoryId);
      subCategoryList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onInit() {
    getSubCategory(Get.arguments);
    super.onInit();
  }
}

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/ui/screen/home/model/categories_model.dart';
import '../../../../core/network/utils/error_util.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../ui_failure/ui_result.dart';

class CategoriesController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<CategoriesList> categoriesList = [];
  UiFailure? uiFailure;

  Future<UiResult<bool>> getCategories() async {
    try {
      isLoading = true;
      final response = await userRepo.category();
      categoriesList = response;
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}

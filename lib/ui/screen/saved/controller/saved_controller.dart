import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:urban_farmer/core/utils/global.dart';
import 'package:urban_farmer/ui/screen/saved/model/favorite_list_model.dart';
import 'package:urban_farmer/ui/ui_failure/ui_result.dart';
import '../../../../core/network/utils/error_util.dart';
import '../../../../core/repository/user_repository.dart';

class SavedController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  UiFailure? uiFailure;

  List<WishFavoriteDataModel> wishFavoriteList = [];
  Future<UiResult<bool>> isFavoriteList() async {
    try {
      isLoading = true;
      final response =
          await userRepo.favoriteList(appController.userModelData!.userId);
      wishFavoriteList = response;
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onInit() {
    isFavoriteList();
    super.onInit();
  }
}

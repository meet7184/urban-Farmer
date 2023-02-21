import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../ui/screen/login/user_model/user_model.dart';
import 'app_prefs.dart';

class AppController extends GetxController {
  UserModelData? userModelData;
  final appPref = GetIt.I.get<AppPrefs>();

  @override
  void onInit() {
    userModelData = appPref.getUser;
    super.onInit();
  }
}

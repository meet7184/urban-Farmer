import 'package:get/get.dart';
import 'package:urban_farmer/core/utils/app_controller.dart';
import 'package:urban_farmer/ui/screen/forgot/controller/forgot_contoller.dart';
import 'package:urban_farmer/ui/screen/home/controller/home_controller.dart';
import 'package:urban_farmer/ui/screen/home/controller/sub_category_controller.dart';
import '../../ui/screen/cart/controller/car_controller.dart';
import '../../ui/screen/home/controller/categories_controller.dart';
import '../../ui/screen/home/controller/products_controller.dart';
import '../../ui/screen/home/controller/products_details_controller.dart';
import '../../ui/screen/login/controller/login_controller.dart';
import '../../ui/screen/login/controller/sign_up_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<ForgotController>(() => ForgotController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ProductsController>(() => ProductsController(), fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
    Get.lazyPut<SubCategoryController>(() => SubCategoryController(),
        fenix: true);
    Get.lazyPut<ProductsDetailsController>(() => ProductsDetailsController(),
        fenix: true);
    Get.lazyPut<CategoriesController>(() => CategoriesController(),
        fenix: true);
  }
}

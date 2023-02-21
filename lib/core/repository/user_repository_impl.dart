import 'package:get_it/get_it.dart';
import 'package:urban_farmer/ui/screen/cart/model/cart_model.dart';
import 'package:urban_farmer/ui/screen/home/model/categories_model.dart';
import 'package:urban_farmer/ui/screen/home/model/products_details_model.dart';
import 'package:urban_farmer/ui/screen/home/model/services_model.dart';
import 'package:urban_farmer/ui/screen/home/model/sub_category_model.dart';
import 'package:urban_farmer/ui/screen/home/model/trending_products_model.dart';
import '../../ui/screen/home/model/banner_model.dart';
import '../../ui/screen/login/user_model/user_model.dart';
import '../network/api_client.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final repo = GetIt.I.get<ApiClient>();

  @override
  Future<void> singUpAccount(
      String name,
      String mobileNumber,
      String email,
      String city,
      String state,
      String address,
      String zipCode,
      String password) async {
    return await repo.singUpAccount(
        name, mobileNumber, email, city, state, address, zipCode, password);
  }

  @override
  Future<void> signUpVerify(String otp, String mobile) async {
    return await repo.signUpVerify(otp, mobile);
  }

  @override
  Future<void> login(String mobile, String password) async {
    return await repo.login(mobile, password);
  }

  @override
  Future<UserModelData> loginVerify(String otp, String mobile) async {
    return await repo.loginVerify(otp, mobile);
  }

  @override
  Future<void> forgotPassword(String mobile) async {
    return await repo.forgotPassword(mobile);
  }

  @override
  Future<void> forgotVerify(String otp, String mobile) async {
    return await repo.forgotVerify(otp, mobile);
  }

  @override
  Future<void> resetPassword(String mobile, String password) async {
    return await repo.resetPassword(mobile, password);
  }

  @override
  Future<List<BannerListModel>> bannerCategory() async {
    return await repo.bannerCategory();
  }

  @override
  Future<List<CategoriesList>> category() async {
    return await repo.category();
  }

  @override
  Future<List<SubCategoryList>> subCategory(String subCategoryId) async {
    return await repo.subCategory(subCategoryId);
  }

  @override
  Future<ServicesModel> services() async {
    return await repo.services();
  }

  @override
  Future<List<TrendingProductsList>> trendingProducts() async {
    return await repo.trendingProducts();
  }

  @override
  Future<ProductDataList> productsDetails(String productId) async {
    return await repo.productsDetails(productId);
  }

  @override
  Future<void> addCart(String userId, String productId, String productQuantity,
      String productPrice) async {
    return await repo.addCart(userId, productId, productQuantity, productPrice);
  }

  @override
  Future<List<CartModelList>> cartViewList(String userId) async {
    return await repo.cartViewList(userId);
  }
}

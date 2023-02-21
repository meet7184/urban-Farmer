import 'package:urban_farmer/ui/screen/cart/model/cart_model.dart';
import 'package:urban_farmer/ui/screen/home/model/categories_model.dart';
import 'package:urban_farmer/ui/screen/home/model/products_details_model.dart';
import 'package:urban_farmer/ui/screen/home/model/services_model.dart';
import 'package:urban_farmer/ui/screen/home/model/trending_products_model.dart';
import '../../ui/screen/home/model/banner_model.dart';
import '../../ui/screen/home/model/sub_category_model.dart';
import '../../ui/screen/login/user_model/user_model.dart';

abstract class ApiClient {
  Future<void> singUpAccount(
      String name,
      String mobileNumber,
      String email,
      String city,
      String state,
      String address,
      String zipCode,
      String password);

  Future<void> signUpVerify(String otp, String mobile);

  Future<void> login(String mobile, String password);

  Future<UserModelData> loginVerify(String otp, String mobile);

  Future<void> forgotPassword(String mobile);

  Future<void> forgotVerify(String otp, String mobile);

  Future<void> resetPassword(String mobile, String password);

  Future<List<BannerListModel>> bannerCategory();

  Future<List<CategoriesList>> category();

  Future<List<SubCategoryList>> subCategory(String subCategoryId);

  Future<ServicesModel> services();

  Future<List<TrendingProductsList>> trendingProducts();

  Future<ProductDataList> productsDetails(String productId);

  Future<void> addCart(String userId, String productId, String productQuantity,
      String productPrice);

  Future<List<CartModelList>> cartViewList(String userId);
}

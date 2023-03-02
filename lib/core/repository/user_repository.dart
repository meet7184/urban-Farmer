import '../../ui/screen/cart/model/address_list_model.dart';
import '../../ui/screen/cart/model/cart_model.dart';
import '../../ui/screen/cart/model/count_model.dart';
import '../../ui/screen/cart/model/order_history_model.dart';
import '../../ui/screen/home/model/banner_model.dart';
import '../../ui/screen/home/model/categories_model.dart';
import '../../ui/screen/home/model/products_details_model.dart';
import '../../ui/screen/home/model/services_model.dart';
import '../../ui/screen/home/model/sub_category_model.dart';
import '../../ui/screen/home/model/trending_products_model.dart';
import '../../ui/screen/login/user_model/user_model.dart';
import '../../ui/screen/saved/model/favorite_list_model.dart';

abstract class UserRepository {
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

  Future<void> updateQuantityCart(
      String quantity, String userId, String productId);

  Future<List<OrderHistoryList>> orderHistory(String userId);

  Future<void> orderPlace(String userId, String name, String mobileNumber,
      String email, String address, String city, String state, String zipCode);

  Future<OrderCountModel> cartOrderCount(String userId);

  Future<List<AddressListData>> addressList(String userId);

  Future<void> addAddress(String userId, String name, String mobileNumber,
      String email, String address, String city, String state, String zipCode);

  Future<void> cartProductRemove(String userId, String productId);

  Future<void> favorite(String userId, String productId);

  Future<void> favoriteRemove(String userId, String productId);

  Future<List<WishFavoriteDataModel>> favoriteList(String userId);
}

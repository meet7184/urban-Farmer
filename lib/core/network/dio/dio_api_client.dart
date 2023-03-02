import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:urban_farmer/core/network/dio/dio_extension.dart';
import 'package:urban_farmer/ui/screen/cart/model/address_list_model.dart';
import 'package:urban_farmer/ui/screen/cart/model/cart_model.dart';
import 'package:urban_farmer/ui/screen/cart/model/order_history_model.dart';
import 'package:urban_farmer/ui/screen/home/model/banner_model.dart';
import 'package:urban_farmer/ui/screen/home/model/categories_model.dart';
import 'package:urban_farmer/ui/screen/home/model/products_details_model.dart';
import 'package:urban_farmer/ui/screen/home/model/services_model.dart';
import 'package:urban_farmer/ui/screen/home/model/sub_category_model.dart';
import 'package:urban_farmer/ui/screen/home/model/trending_products_model.dart';
import 'package:urban_farmer/ui/screen/saved/model/favorite_list_model.dart';
import '../../../ui/screen/cart/model/count_model.dart';
import '../../../ui/screen/login/user_model/user_model.dart';
import '../../utils/base_url.dart';
import '../api_client.dart';

class DioApiClient extends ApiClient {
  static late DioApiClient _service;

  static Dio? _dio;

  static Dio get _dioClient => _dio!;

  DioApiClient._();

  static Future<DioApiClient> getInstance() async {
    if (_dio == null) {
      _dio = _init();
      _service = DioApiClient._();
    }
    return _service;
  }

  static Dio _init() {
    final dio = Dio();
    dio.options.baseUrl = BaseUrl.baseUrl;

    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            if (options.data is FormData) {
              FormData d = options.data;
              d.fields.forEach(((field) =>
                  debugPrint('Fields: ${field.key}: ${field.value}')));
              d.files.forEach(((field) => debugPrint(
                  'Files: ${field.key}: ${field.value.filename} (${field.value.contentType?.mimeType})')));
            }
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: kDebugMode,
      request: kDebugMode,
      requestHeader: kDebugMode,
      responseBody: kDebugMode,
    ));
    return dio;
  }

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
    final param = {
      "Name": name,
      "phone": mobileNumber,
      "Email": email,
      "city": city,
      "state": state,
      "address": address,
      "zipcode": zipCode,
      "password": password
    };
    await _dioClient.postMultipartApi(UrlPath.signUp,
        formData: FormData.fromMap(param));
  }

  @override
  Future<void> signUpVerify(String otp, String mobile) async {
    final param = {
      "otp": otp,
      "mobile": mobile,
    };
    await _dioClient.postMultipartApi(UrlPath.signUpAndLoginVerifyApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<void> login(String mobile, String password) async {
    final param = {
      "phone": mobile,
      "password": password,
    };
    await _dioClient.postMultipartApi(UrlPath.loginApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<UserModelData> loginVerify(String otp, String mobile) async {
    final param = {
      "otp": otp,
      "mobile": mobile,
    };
    final response = await _dioClient.postMultipartApi(
        UrlPath.signUpAndLoginVerifyApi,
        formData: FormData.fromMap(param));
    return UserModelData.fromJson(response.data);
  }

  @override
  Future<void> forgotPassword(String mobile) async {
    final param = {
      "mobile": mobile,
    };
    await _dioClient.postMultipartApi(UrlPath.forgetApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<void> forgotVerify(String otp, String mobile) async {
    final param = {
      "otp": otp,
      "mobile": mobile,
    };
    await _dioClient.postMultipartApi(UrlPath.signUpAndLoginVerifyApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<void> resetPassword(String mobile, String password) async {
    final param = {
      "mobile": mobile,
      "newPassword": password,
    };
    await _dioClient.postMultipartApi(UrlPath.resetPasswordApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<List<BannerListModel>> bannerCategory() async {
    final response = await _dioClient.postApi(UrlPath.bannerApi);
    return List<BannerListModel>.from(
      response.data.map(
        (e) => BannerListModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<CategoriesList>> category() async {
    final response = await _dioClient.postApi(UrlPath.categoryApi);
    return List<CategoriesList>.from(
      response.data.map(
        (e) => CategoriesList.fromJson(e),
      ),
    );
  }

  @override
  Future<List<SubCategoryList>> subCategory(String subCategoryId) async {
    final param = {"Subcat": subCategoryId};
    final response = await _dioClient.postMultipartApi(UrlPath.subCategoryApi,
        formData: FormData.fromMap(param));
    return List<SubCategoryList>.from(
      response.data.map(
        (e) => SubCategoryList.fromJson(e),
      ),
    );
  }

  @override
  Future<ServicesModel> services() async {
    final response = await _dioClient.postApi(UrlPath.serviceApi);
    return ServicesModel.fromJson(response.data);
  }

  @override
  Future<List<TrendingProductsList>> trendingProducts() async {
    final response = await _dioClient.postApi(UrlPath.trendingProductApi);
    return List<TrendingProductsList>.from(
      response.data.map(
        (e) => TrendingProductsList.fromJson(e),
      ),
    );
  }

  @override
  Future<ProductDataList> productsDetails(String productId) async {
    final param = {"product": productId};
    final response = await _dioClient.postMultipartApi(
        UrlPath.productDetailsApi,
        formData: FormData.fromMap(param));
    return ProductDataList.fromJson(response.data);
  }

  @override
  Future<void> addCart(String userId, String productId, String productQuantity,
      String productPrice) async {
    final param = {
      "user_id": userId,
      "product_id": productId,
      "product_qty": productQuantity,
      "product_price": productPrice,
    };
    await _dioClient.postMultipartApi(UrlPath.addCartApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<List<CartModelList>> cartViewList(String userId) async {
    final param = {
      "user_id": userId,
    };
    final response = await _dioClient.postMultipartApi(UrlPath.cartViewListApi,
        formData: FormData.fromMap(param));
    return List<CartModelList>.from(
      response.data.map(
        (e) => CartModelList.fromJson(e),
      ),
    );
  }

  @override
  Future<void> updateQuantityCart(
      String quantity, String userId, String productId) async {
    final param = {
      "action": quantity,
      "user_id": userId,
      "product_id": productId,
    };
    await _dioClient.postMultipartApi(UrlPath.updateProQtyApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<List<OrderHistoryList>> orderHistory(String userId) async {
    final param = {
      "user_id": userId,
    };
    final response = await _dioClient.postMultipartApi(UrlPath.orderHistoryApi,
        formData: FormData.fromMap(param));
    return List<OrderHistoryList>.from(
      response.data.map(
        (e) => OrderHistoryList.fromJson(e),
      ),
    );
  }

  @override
  Future<void> orderPlace(
      String userId,
      String name,
      String mobileNumber,
      String email,
      String address,
      String city,
      String state,
      String zipCode) async {
    final param = {
      "user_id": userId,
      "name": name,
      "phone": mobileNumber,
      "email": email,
      "address": address,
      "city": city,
      "state": state,
      "pincode": zipCode,
    };
    await _dioClient.postMultipartApi(UrlPath.placeOrderApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<OrderCountModel> cartOrderCount(String userId) async {
    final param = {
      "user_id": userId,
    };
    final response = await _dioClient.postMultipartApi(
        UrlPath.orderCountCartApi,
        formData: FormData.fromMap(param));
    return OrderCountModel.fromJson(response.data);
  }

  @override
  Future<void> addAddress(
      String userId,
      String name,
      String mobileNumber,
      String email,
      String address,
      String city,
      String state,
      String zipCode) async {
    final param = {
      "user_id": userId,
      "name": name,
      "phone": mobileNumber,
      "email": email,
      "address": address,
      "city": city,
      "state": state,
      "pincode": zipCode,
    };
    await _dioClient.postMultipartApi(UrlPath.addAddressApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<List<AddressListData>> addressList(String userId) async {
    final param = {
      "user_id": userId,
    };
    final response = await _dioClient.postMultipartApi(UrlPath.addressListApi,
        formData: FormData.fromMap(param));
    return List<AddressListData>.from(
      response.data.map(
        (e) => AddressListData.fromJson(e),
      ),
    );
  }

  @override
  Future<void> cartProductRemove(String userId, String productId) async {
    final param = {
      "user_id": userId,
      "product_id": productId,
    };
    await _dioClient.postMultipartApi(UrlPath.cartProductRemoveApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<void> favorite(String userId, String productId) async {
    final param = {
      "user_id": userId,
      "product_id": productId,
    };
    await _dioClient.postMultipartApi(UrlPath.favoriteApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<void> favoriteRemove(String userId, String productId) async {
    final param = {
      "user_id": userId,
      "product_id": productId,
    };
    await _dioClient.postMultipartApi(UrlPath.favoriteRemoveApi,
        formData: FormData.fromMap(param));
  }

  @override
  Future<List<WishFavoriteDataModel>> favoriteList(String userId) async {
    final param = {
      "user_id": userId,
    };
    final response = await _dioClient.postMultipartApi(
        UrlPath.wishFavoriteListApi,
        formData: FormData.fromMap(param));
    return List<WishFavoriteDataModel>.from(
      response.data.map(
        (e) => WishFavoriteDataModel.fromJson(e),
      ),
    );
  }
}

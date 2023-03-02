class WishFavoriteListModel {
  WishFavoriteListModel({
    required this.data,
  });

  List<WishFavoriteDataModel> data;

  factory WishFavoriteListModel.fromJson(Map<String, dynamic> json) =>
      WishFavoriteListModel(
        data: List<WishFavoriteDataModel>.from(
            json["data"].map((x) => WishFavoriteDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WishFavoriteDataModel {
  WishFavoriteDataModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.productQty,
    required this.productPrice,
    required this.productsId,
    required this.productsName,
    required this.productsSlug,
    required this.productsDiscription,
    required this.productsMrp,
    required this.productsSalePrice,
    required this.productsTax,
    required this.productsStock,
    required this.outofstock,
    required this.productCategory,
    required this.productSubCategory,
    required this.productImage,
    required this.productStatus,
    required this.productCreationDate,
  });

  String id;
  String userId;
  String productId;
  String productQty;
  String productPrice;
  String productsId;
  String productsName;
  String productsSlug;
  String productsDiscription;
  String productsMrp;
  String productsSalePrice;
  String productsTax;
  String productsStock;
  String outofstock;
  String productCategory;
  String productSubCategory;
  String productImage;
  String productStatus;
  DateTime productCreationDate;

  factory WishFavoriteDataModel.fromJson(Map<String, dynamic> json) =>
      WishFavoriteDataModel(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        productQty: json["product_qty"],
        productPrice: json["product_price"],
        productsId: json["Products_Id"],
        productsName: json["Products_Name"],
        productsSlug: json["Products_Slug"],
        productsDiscription: json["Products_Discription"],
        productsMrp: json["Products_MRP"],
        productsSalePrice: json["Products_SalePrice"],
        productsTax: json["Products_Tax"],
        productsStock: json["Products_Stock"],
        outofstock: json["Outofstock"],
        productCategory: json["Product_Category"],
        productSubCategory: json["Product_SubCategory"],
        productImage: json["Product_Image"],
        productStatus: json["Product_Status"],
        productCreationDate: DateTime.parse(json["Product_Creation_Date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "product_qty": productQty,
        "product_price": productPrice,
        "Products_Id": productsId,
        "Products_Name": productsName,
        "Products_Slug": productsSlug,
        "Products_Discription": productsDiscription,
        "Products_MRP": productsMrp,
        "Products_SalePrice": productsSalePrice,
        "Products_Tax": productsTax,
        "Products_Stock": productsStock,
        "Outofstock": outofstock,
        "Product_Category": productCategory,
        "Product_SubCategory": productSubCategory,
        "Product_Image": productImage,
        "Product_Status": productStatus,
        "Product_Creation_Date": productCreationDate.toIso8601String(),
      };
}

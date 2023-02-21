// class ProductsDetailsModel {
//   ProductsDetailsModel({
//     required this.data,
//   });
//
//   ProductsDetailsList data;
//
//   factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) =>
//       ProductsDetailsModel(
//         data: ProductsDetailsList.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }
//
// class ProductsDetailsList {
//   ProductsDetailsList({
//     required this.product,
//   });
//
//   Product product;
//
//   factory ProductsDetailsList.fromJson(Map<String, dynamic> json) =>
//       ProductsDetailsList(
//         product: Product.fromJson(json["product"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "product": product.toJson(),
//       };
// }
//
// class Product {
//   Product({
//     required this.productsId,
//     required this.productsName,
//     required this.productsSlug,
//     required this.productsDiscription,
//     required this.productsMrp,
//     required this.productsSalePrice,
//     required this.productsTax,
//     required this.productsStock,
//     required this.outofstock,
//     required this.productCategory,
//     required this.productSubCategory,
//     required this.productImage,
//     required this.productStatus,
//     required this.productCreationDate,
//   });
//
//   String productsId;
//   String productsName;
//   String productsSlug;
//   String productsDiscription;
//   String productsMrp;
//   String productsSalePrice;
//   String productsTax;
//   String productsStock;
//   String outofstock;
//   String productCategory;
//   String productSubCategory;
//   String productImage;
//   String productStatus;
//   DateTime productCreationDate;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         productsId: json["Products_Id"] ?? "",
//         productsName: json["Products_Name"] ?? "",
//         productsSlug: json["Products_Slug"] ?? "",
//         productsDiscription: json["Products_Discription"] ?? "",
//         productsMrp: json["Products_MRP"] ?? "",
//         productsSalePrice: json["Products_SalePrice"] ?? "",
//         productsTax: json["Products_Tax"] ?? "",
//         productsStock: json["Products_Stock"] ?? "",
//         outofstock: json["Outofstock"] ?? "",
//         productCategory: json["Product_Category"] ?? "",
//         productSubCategory: json["Product_SubCategory"] ?? "",
//         productImage: json["Product_Image"] ?? "",
//         productStatus: json["Product_Status"] ?? "",
//         productCreationDate: DateTime.parse(json["Product_Creation_Date"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Products_Id": productsId,
//         "Products_Name": productsName,
//         "Products_Slug": productsSlug,
//         "Products_Discription": productsDiscription,
//         "Products_MRP": productsMrp,
//         "Products_SalePrice": productsSalePrice,
//         "Products_Tax": productsTax,
//         "Products_Stock": productsStock,
//         "Outofstock": outofstock,
//         "Product_Category": productCategory,
//         "Product_SubCategory": productSubCategory,
//         "Product_Image": productImage,
//         "Product_Status": productStatus,
//         "Product_Creation_Date": productCreationDate.toIso8601String(),
//       };
// }

class ProductsDetailsModel {
  ProductsDetailsModel({
    required this.data,
  });

  ProductDataList data;

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductsDetailsModel(
        data: ProductDataList.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ProductDataList {
  ProductDataList({
    required this.title,
    required this.description,
    required this.product,
    required this.attribute,
  });

  String title;
  String description;
  Product product;
  List<dynamic> attribute;

  factory ProductDataList.fromJson(Map<String, dynamic> json) =>
      ProductDataList(
        title: json["title"],
        description: json["Description"],
        product: Product.fromJson(json["product"]),
        attribute: List<dynamic>.from(json["attribute"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "Description": description,
        "product": product.toJson(),
        "attribute": List<dynamic>.from(attribute.map((x) => x)),
      };
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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

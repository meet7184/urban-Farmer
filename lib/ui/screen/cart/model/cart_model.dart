class CartModel {
  CartModel({
    required this.data,
  });

  List<CartModelList> data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: List<CartModelList>.from(
            json["data"].map((x) => CartModelList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CartModelList {
  CartModelList({
    required this.qty,
    required this.productsName,
    required this.productImage,
    required this.productsSalePrice,
  });

  String qty;
  String productsName;
  String productImage;
  String productsSalePrice;

  factory CartModelList.fromJson(Map<String, dynamic> json) => CartModelList(
        qty: json["qty"],
        productsName: json["Products_Name"],
        productImage: json["Product_Image"],
        productsSalePrice: json["Products_SalePrice"],
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
        "Products_Name": productsName,
        "Product_Image": productImage,
        "Products_SalePrice": productsSalePrice,
      };
}

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
    required this.productsId,
    required this.productImage,
    required this.productsSalePrice,
  });

  int qty;
  String productsName;
  String productsId;
  String productImage;
  double productsSalePrice;

  factory CartModelList.fromJson(Map<String, dynamic> json) => CartModelList(
        qty: int.parse(json["qty"].toString()),
        productsName: json["Products_Name"],
        productsId: json["Products_Id"],
        productImage: json["Product_Image"],
        productsSalePrice: double.parse(json["Products_SalePrice"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
        "Products_Name": productsName,
        "Products_Id": productsId,
        "Product_Image": productImage,
        "Products_SalePrice": productsSalePrice,
      };
}

class OderHistoryModel {
  OderHistoryModel({
    required this.data,
  });

  List<OrderHistoryList> data;

  factory OderHistoryModel.fromJson(Map<String, dynamic> json) =>
      OderHistoryModel(
        data: List<OrderHistoryList>.from(
            json["data"].map((x) => OrderHistoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrderHistoryList {
  OrderHistoryList({
    required this.orderId,
    required this.orderIds,
    required this.userId,
    required this.name,
    required this.country,
    required this.state,
    required this.city,
    required this.address1,
    required this.address2,
    required this.pincode,
    required this.phone,
    required this.email,
    required this.orderTotalAmt,
    required this.orderStatus,
    required this.shippingStatus,
    required this.razorpaypaymentid,
    required this.razorpayorderid,
    required this.paymentstatus,
    required this.paymentDate,
    required this.orderDate,
    required this.orderUpdationDate,
    required this.length,
    required this.breadth,
    required this.height,
    required this.weight,
    required this.status,
    required this.orderDetailId,
    required this.productId,
    required this.productName,
    required this.datumProductImage,
    required this.productPrice,
    required this.detailOrderId,
    required this.qty,
    required this.amount,
    required this.creationDate,
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

  String orderId;
  String orderIds;
  String userId;
  String name;
  String country;
  String state;
  String city;
  String address1;
  String address2;
  String pincode;
  String phone;
  String email;
  String orderTotalAmt;
  String orderStatus;
  String shippingStatus;
  String razorpaypaymentid;
  String razorpayorderid;
  String paymentstatus;
  DateTime paymentDate;
  DateTime orderDate;
  DateTime orderUpdationDate;
  String length;
  String breadth;
  String height;
  String weight;
  String status;
  String orderDetailId;
  String productId;
  String productName;
  String datumProductImage;
  String productPrice;
  String detailOrderId;
  String qty;
  String amount;
  DateTime creationDate;
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

  factory OrderHistoryList.fromJson(Map<String, dynamic> json) =>
      OrderHistoryList(
        orderId: json["Order_Id"],
        orderIds: json["order_ids"],
        userId: json["User_Id"],
        name: json["name"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        address1: json["address1"],
        address2: json["address2"],
        pincode: json["pincode"],
        phone: json["phone"],
        email: json["email"],
        orderTotalAmt: json["Order_TotalAmt"],
        orderStatus: json["Order_status"],
        shippingStatus: json["Shipping_status"],
        razorpaypaymentid: json["razorpaypaymentid"],
        razorpayorderid: json["razorpayorderid"],
        paymentstatus: json["paymentstatus"],
        paymentDate: DateTime.parse(json["Payment_Date"]),
        orderDate: DateTime.parse(json["Order_date"]),
        orderUpdationDate: DateTime.parse(json["Order_Updation_Date"]),
        length: json["length"],
        breadth: json["breadth"],
        height: json["height"],
        weight: json["weight"],
        status: json["status"],
        orderDetailId: json["order_detail_Id"],
        productId: json["product_id"],
        productName: json["product_name"],
        datumProductImage: json["product_image"],
        productPrice: json["product_price"],
        detailOrderId: json["detail_order_id"],
        qty: json["qty"],
        amount: json["amount"],
        creationDate: DateTime.parse(json["Creation_date"]),
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
        "Order_Id": orderId,
        "order_ids": orderIds,
        "User_Id": userId,
        "name": name,
        "country": country,
        "state": state,
        "city": city,
        "address1": address1,
        "address2": address2,
        "pincode": pincode,
        "phone": phone,
        "email": email,
        "Order_TotalAmt": orderTotalAmt,
        "Order_status": orderStatus,
        "Shipping_status": shippingStatus,
        "razorpaypaymentid": razorpaypaymentid,
        "razorpayorderid": razorpayorderid,
        "paymentstatus": paymentstatus,
        "Payment_Date": paymentDate.toIso8601String(),
        "Order_date": orderDate.toIso8601String(),
        "Order_Updation_Date": orderUpdationDate.toIso8601String(),
        "length": length,
        "breadth": breadth,
        "height": height,
        "weight": weight,
        "status": status,
        "order_detail_Id": orderDetailId,
        "product_id": productId,
        "product_name": productName,
        "product_image": datumProductImage,
        "product_price": productPrice,
        "detail_order_id": detailOrderId,
        "qty": qty,
        "amount": amount,
        "Creation_date": creationDate.toIso8601String(),
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

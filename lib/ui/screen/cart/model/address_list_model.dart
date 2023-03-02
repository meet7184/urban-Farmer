class AddressListModel {
  AddressListModel({
    required this.data,
  });

  List<AddressListData> data;

  factory AddressListModel.fromJson(Map<String, dynamic> json) =>
      AddressListModel(
        data: List<AddressListData>.from(
            json["data"].map((x) => AddressListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AddressListData {
  AddressListData({
    required this.id,
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
    required this.status,
  });

  String id;
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
  String status;

  factory AddressListData.fromJson(Map<String, dynamic> json) =>
      AddressListData(
        id: json["id"],
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
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "status": status,
      };
}

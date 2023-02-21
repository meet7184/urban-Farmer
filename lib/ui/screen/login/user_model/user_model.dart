class UserModel {
  UserModel({
    required this.data,
  });

  UserModelData data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: UserModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class UserModelData {
  UserModelData({
    required this.userId,
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.password,
  });

  String userId;
  String email;
  String name;
  String phone;
  String address;
  String city;
  String state;
  String zipcode;
  String password;

  factory UserModelData.fromJson(Map<String, dynamic> json) => UserModelData(
        userId: json["user_id"] ?? "",
        email: json["email"] ?? "",
        name: json["name"] ?? "",
        phone: json["phone"] ?? '',
        address: json["address"] ?? "",
        city: json["city"] ?? '',
        state: json["state"] ?? "",
        zipcode: json["zipcode"] ?? '',
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "name": name,
        "phone": phone,
        "address": address,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "password": password,
      };
}

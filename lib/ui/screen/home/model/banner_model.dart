// class BannerModel {
//   BannerModel({
//     required this.status,
//     required this.data,
//   });
//
//   bool status;
//   List<BannerListModel> data;
//
//   factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
//         status: json["status"],
//         data: List<BannerListModel>.from(
//             json["data"].map((x) => BannerListModel.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
//
// class BannerListModel {
//   BannerListModel({
//     required this.bannerId,
//     required this.bannerName,
//     required this.bannerUrl,
//     required this.bannerImage,
//     required this.bannerStatus,
//     required this.bannerCreated,
//   });
//
//   String bannerId;
//   String bannerName;
//   String bannerUrl;
//   String bannerImage;
//   String bannerStatus;
//   DateTime bannerCreated;
//
//   factory BannerListModel.fromJson(Map<String, dynamic> json) =>
//       BannerListModel(
//         bannerId: json["Banner_Id"],
//         bannerName: json["Banner_Name"],
//         bannerUrl: json["Banner_url"],
//         bannerImage: json["Banner_Image"],
//         bannerStatus: json["Banner_Status"],
//         bannerCreated: DateTime.parse(json["Banner_created"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Banner_Id": bannerId,
//         "Banner_Name": bannerName,
//         "Banner_url": bannerUrl,
//         "Banner_Image": bannerImage,
//         "Banner_Status": bannerStatus,
//         "Banner_created": bannerCreated.toIso8601String(),
//       };
// }

class BannerModel {
  BannerModel({
    required this.data,
  });

  List<BannerListModel> data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        data: List<BannerListModel>.from(
            json["data"].map((x) => BannerListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BannerListModel {
  BannerListModel({
    required this.bannerId,
    required this.bannerName,
    required this.bannerUrl,
    required this.bannerImage,
    required this.bannerStatus,
    required this.bannerCreated,
  });

  String bannerId;
  String bannerName;
  String bannerUrl;
  String bannerImage;
  String bannerStatus;
  DateTime bannerCreated;

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      BannerListModel(
        bannerId: json["Banner_Id"],
        bannerName: json["Banner_Name"],
        bannerUrl: json["Banner_url"],
        bannerImage: json["Banner_Image"],
        bannerStatus: json["Banner_Status"],
        bannerCreated: DateTime.parse(json["Banner_created"]),
      );

  Map<String, dynamic> toJson() => {
        "Banner_Id": bannerId,
        "Banner_Name": bannerName,
        "Banner_url": bannerUrl,
        "Banner_Image": bannerImage,
        "Banner_Status": bannerStatus,
        "Banner_created": bannerCreated.toIso8601String(),
      };
}

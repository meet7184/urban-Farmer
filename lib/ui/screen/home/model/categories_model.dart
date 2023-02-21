// class CategoriesModel {
//   CategoriesModel({
//     required this.status,
//     required this.data,
//   });
//
//   bool status;
//   List<CategoriesList> data;
//
//   factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
//       CategoriesModel(
//         status: json["status"],
//         data: List<CategoriesList>.from(
//             json["data"].map((x) => CategoriesList.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
//
// class CategoriesList {
//   CategoriesList({
//     required this.categoriesId,
//     required this.categoriesName,
//     required this.categoriesImage,
//     required this.categoriesDiscountPersent,
//     required this.categoriesTax,
//     required this.categoriesDiscountText,
//     required this.categoriesStatus,
//     required this.categoriesCreated,
//   });
//
//   String categoriesId;
//   String categoriesName;
//   String categoriesImage;
//   String categoriesDiscountPersent;
//   String categoriesTax;
//   String categoriesDiscountText;
//   String categoriesStatus;
//   DateTime categoriesCreated;
//
//   factory CategoriesList.fromJson(Map<String, dynamic> json) => CategoriesList(
//         categoriesId: json["Categories_id"],
//         categoriesName: json["Categories_Name"],
//         categoriesImage: json["Categories_Image"],
//         categoriesDiscountPersent: json["Categories_Discount_Persent"],
//         categoriesTax: json["Categories_Tax"],
//         categoriesDiscountText: json["Categories_Discount_text"],
//         categoriesStatus: json["Categories_Status"],
//         categoriesCreated: DateTime.parse(json["Categories_Created"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Categories_id": categoriesId,
//         "Categories_Name": categoriesName,
//         "Categories_Image": categoriesImage,
//         "Categories_Discount_Persent": categoriesDiscountPersent,
//         "Categories_Tax": categoriesTax,
//         "Categories_Discount_text": categoriesDiscountText,
//         "Categories_Status": categoriesStatus,
//         "Categories_Created": categoriesCreated.toIso8601String(),
//       };
// }

class CategoriesModel {
  CategoriesModel({
    required this.data,
  });

  List<CategoriesList> data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        data: List<CategoriesList>.from(
            json["data"].map((x) => CategoriesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoriesList {
  CategoriesList({
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesImage,
    required this.categoriesDiscountPersent,
    required this.categoriesTax,
    required this.categoriesDiscountText,
    required this.categoriesStatus,
    required this.categoriesCreated,
  });

  String categoriesId;
  String categoriesName;
  String categoriesImage;
  String categoriesDiscountPersent;
  String categoriesTax;
  String categoriesDiscountText;
  String categoriesStatus;
  DateTime categoriesCreated;

  factory CategoriesList.fromJson(Map<String, dynamic> json) => CategoriesList(
        categoriesId: json["Categories_id"],
        categoriesName: json["Categories_Name"],
        categoriesImage: json["Categories_Image"],
        categoriesDiscountPersent: json["Categories_Discount_Persent"],
        categoriesTax: json["Categories_Tax"],
        categoriesDiscountText: json["Categories_Discount_text"],
        categoriesStatus: json["Categories_Status"],
        categoriesCreated: DateTime.parse(json["Categories_Created"]),
      );

  Map<String, dynamic> toJson() => {
        "Categories_id": categoriesId,
        "Categories_Name": categoriesName,
        "Categories_Image": categoriesImage,
        "Categories_Discount_Persent": categoriesDiscountPersent,
        "Categories_Tax": categoriesTax,
        "Categories_Discount_text": categoriesDiscountText,
        "Categories_Status": categoriesStatus,
        "Categories_Created": categoriesCreated.toIso8601String(),
      };
}

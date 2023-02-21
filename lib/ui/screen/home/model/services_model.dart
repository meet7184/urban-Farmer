class ServicesModel {
  ServicesModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<ServicesList> data;

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        status: json["status"],
        data: List<ServicesList>.from(
            json["data"].map((x) => ServicesList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ServicesList {
  ServicesList({
    required this.servicesOfferId,
    required this.servicesOfferName,
    required this.servicesOfferImage,
    required this.servicesOfferStatus,
    required this.servicesOfferCreationDate,
  });

  String servicesOfferId;
  String servicesOfferName;
  String servicesOfferImage;
  String servicesOfferStatus;
  DateTime servicesOfferCreationDate;

  factory ServicesList.fromJson(Map<String, dynamic> json) => ServicesList(
        servicesOfferId: json["ServicesOffer_ID"],
        servicesOfferName: json["ServicesOffer_Name"],
        servicesOfferImage: json["ServicesOffer_Image"],
        servicesOfferStatus: json["ServicesOffer_Status"],
        servicesOfferCreationDate:
            DateTime.parse(json["ServicesOffer_CreationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "ServicesOffer_ID": servicesOfferId,
        "ServicesOffer_Name": servicesOfferName,
        "ServicesOffer_Image": servicesOfferImage,
        "ServicesOffer_Status": servicesOfferStatus,
        "ServicesOffer_CreationDate":
            servicesOfferCreationDate.toIso8601String(),
      };
}

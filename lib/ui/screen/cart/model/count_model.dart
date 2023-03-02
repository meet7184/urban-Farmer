class OrderCountModel {
  OrderCountModel({
    required this.count,
  });

  int count;

  factory OrderCountModel.fromJson(Map<String, dynamic> json) =>
      OrderCountModel(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}

class GenderDataModel {
  int count;
  String name;
  String gender;
  double probability;

  GenderDataModel({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability,
  });

  factory GenderDataModel.fromJson(Map<String, dynamic> json) =>
      GenderDataModel(
        count: json["count"],
        name: json["name"],
        gender: json["gender"],
        probability: json["probability"],
      );

  Map<String, dynamic> toJson() =>
      {
        "count": count,
        "name": name,
        "gender": gender,
        "probability": probability,
      };

}
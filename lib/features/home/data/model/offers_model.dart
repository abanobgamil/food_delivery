class OffersModel {
  OffersModel({
    required this.title,
    required this.description,
    required this.image,
  });

  String title;
  String description;
  String image;

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
        title: json["title"],
        description: json["description"],
        image: json["image"]);
  }
}

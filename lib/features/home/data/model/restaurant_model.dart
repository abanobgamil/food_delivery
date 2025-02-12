class RestaurantModel {
  RestaurantModel(
      { this.id,
      required this.deliveryTime,
      required this.rating,
      required this.restaurantImage,
      required this.restaurantName});

  String ? id;
  String ? deliveryTime;
  String ? rating;
  String ? restaurantImage;
  String ? restaurantName;


  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
        id: json["id"],
        deliveryTime: json["delivery_time"],
        rating: json["rating"],
        restaurantImage: json["restaurant image"],
        restaurantName: json["restaurant name"]);
  }

}

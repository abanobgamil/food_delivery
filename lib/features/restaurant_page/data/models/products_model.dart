class ProductsModel {
  ProductsModel(
      { required this.description,
        required this.image,
        required this.name,
        required this.price,
        });

  String  description;
  String  image;
  String  name;
  String  price;


  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        description: json["description"],
        image: json["image"],
        name: json["name"],
        price: json["price"]
    );
  }

}

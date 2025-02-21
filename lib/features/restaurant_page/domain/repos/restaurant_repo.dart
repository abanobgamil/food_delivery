import 'package:food_delivery/features/restaurant_page/data/models/products_model.dart';

abstract class RestaurantRepo{

  Future<List<ProductsModel>> getProducts(String restaurantId);

}
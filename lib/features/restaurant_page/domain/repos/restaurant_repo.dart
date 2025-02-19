import 'package:food_delivery/features/restaurant_page/data/domain/products_model.dart';

abstract class RestaurantRepo{

  Future<List<ProductsModel>> getProducts();

}
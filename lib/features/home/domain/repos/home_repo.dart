import 'package:food_delivery/features/home/data/model/offers_model.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';

abstract class HomeRepo {

  Future<List<RestaurantModel>> getRestaurant();

  Future<List<OffersModel>> getOffers();

}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';
import 'package:food_delivery/features/restaurant_page/data/models/products_model.dart';

class RestaurantState {
  final AsyncValue<List<ProductsModel>> products;

  RestaurantState({
    required this.products,
  });

  RestaurantState.initial()
      : products = const AsyncData([]);

  RestaurantState copyWith({
    AsyncValue<List<ProductsModel>>? products,
  }) {
    return RestaurantState(
      products:  products ?? this.products,
    );
  }
}

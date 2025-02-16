// home_state.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/home/data/model/offers_model.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';

class HomeState {
  final AsyncValue<List<RestaurantModel>> restaurants;
  final AsyncValue<List<OffersModel>> offers;

  HomeState({
    required this.restaurants,
    required this.offers,
  });

  HomeState.initial()
      : restaurants = const AsyncData([]),
        offers = const AsyncData([]);

  HomeState copyWith({
    AsyncValue<List<RestaurantModel>>? restaurants,
    AsyncValue<List<OffersModel>>? offers,
  }) {
    return HomeState(
      restaurants: restaurants ?? this.restaurants,
      offers: offers ?? this.offers,
    );
  }
}

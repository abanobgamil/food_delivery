import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/restaurant_page/data/repos/restaurant_repo_imp.dart';
import 'package:food_delivery/features/restaurant_page/domain/repos/restaurant_repo.dart';
import 'package:food_delivery/features/restaurant_page/presentation/providers/restaurant_states.dart';
import 'package:riverpod/riverpod.dart';

class RestaurantProvider extends StateNotifier<RestaurantState>{

  RestaurantProvider(this._restaurantRepo) : super(RestaurantState.initial());

  final RestaurantRepo _restaurantRepo;


  Future<void> getProducts(String restaurantId) async {
    state = state.copyWith(products: const AsyncLoading());
    try {
      final products = await _restaurantRepo.getProducts(restaurantId);
      state = state.copyWith(products: AsyncData(products));
    } on FirebaseException catch (e, st) {
      state = state.copyWith(
          products: AsyncError(e, st));
    }
  }


}

final restaurantNotifierProvider =
StateNotifierProvider<RestaurantProvider, RestaurantState>((ref) {
  return RestaurantProvider(RestaurantRepoIml());
});
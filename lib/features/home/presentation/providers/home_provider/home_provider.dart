import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';
import 'package:food_delivery/features/home/data/repos/home_repo_impl.dart';
import 'package:food_delivery/features/home/domain/repos/home_repo.dart';
import 'package:food_delivery/features/home/presentation/providers/home_provider/home_states.dart';

class HomeProvider extends StateNotifier<HomeStates> {
  HomeProvider(this.ref, this._homeRepo) : super(InitialHomeState());

  final Ref ref;
  final searchController = TextEditingController();
  final HomeRepo _homeRepo;
  List<RestaurantModel> restaurantList = [];

  Future<void> getRestaurant() async{
    state = HomeLoadingRestaurantState();
    try {
      restaurantList =  await _homeRepo.getRestaurant();
      state = HomeSuccessRestaurantState();
    } on FirebaseException catch (e) {
      state = HomeErrorRestaurantState(message: e.message ?? 'An error occurred');
    }

  }
  Future<void> getOffers() async{
    state = HomeLoadingRestaurantState();
    try {
      restaurantList =  await _homeRepo.getRestaurant();
      state = HomeSuccessRestaurantState();
    } on FirebaseException catch (e) {
      state = HomeErrorRestaurantState(message: e.message ?? 'An error occurred');
    }

  }
}

final homeNotifierProvider =
    StateNotifierProvider<HomeProvider, HomeStates>((ref) {
  return HomeProvider(ref, HomeRepoImpl());
});

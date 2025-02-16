// home_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:food_delivery/features/home/data/repos/home_repo_impl.dart';
import 'package:food_delivery/features/home/domain/repos/home_repo.dart';
import 'package:food_delivery/features/home/presentation/providers/home_provider/home_states.dart';

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(this._homeRepo) : super(HomeState.initial());

  final HomeRepo _homeRepo;
  final searchController = TextEditingController();

  Future<void> getRestaurant() async {
    // Update only the restaurant field to loading
    state = state.copyWith(restaurants: const AsyncLoading());
    try {
      final restaurants = await _homeRepo.getRestaurant();
      state = state.copyWith(restaurants: AsyncData(restaurants));
    } on FirebaseException catch (e, st) {
      state = state.copyWith(
          restaurants: AsyncError(e, st));
    }
  }

  Future<void> getOffers() async {
    // Update only the offers field to loading
    state = state.copyWith(offers: const AsyncLoading());
    try {
      final offers = await _homeRepo.getOffers();
      state = state.copyWith(offers: AsyncData(offers));
    } on FirebaseException catch (e, st) {
      state = state.copyWith(offers: AsyncError(e, st));
    }
  }
}

final homeNotifierProvider =
StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(HomeRepoImpl());
});

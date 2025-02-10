import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/home/presentation/providers/home_states.dart';

class HomeProvider extends StateNotifier<HomeStates>{
  HomeProvider(this.ref) : super(InitialHomeState());

  final Ref ref;
  final searchController = TextEditingController();


}



final homeNotifierProvider = StateNotifierProvider<HomeProvider, HomeStates>((ref) {
  return HomeProvider(ref);
});
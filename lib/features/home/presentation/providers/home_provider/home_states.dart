sealed class HomeStates{}

class InitialHomeState extends HomeStates{}

class HomeLoadingRestaurantState extends HomeStates{}

class HomeSuccessRestaurantState extends HomeStates{}

class HomeErrorRestaurantState extends HomeStates {
  final String message;

  HomeErrorRestaurantState({
    required this.message,
  });
}

class HomeLoadingGetOffersState extends HomeStates{}

class HomeSuccessGetOffersState extends HomeStates{}

class HomeErrorGetOffersState extends HomeStates {
  final String message;

  HomeErrorGetOffersState({
    required this.message,
  });
}


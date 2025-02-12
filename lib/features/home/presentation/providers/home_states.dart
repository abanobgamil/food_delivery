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


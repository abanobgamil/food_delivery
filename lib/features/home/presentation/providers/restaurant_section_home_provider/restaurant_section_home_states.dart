sealed class RestaurantSectionHomeStates{}

class InitialHomeState extends RestaurantSectionHomeStates{}

class HomeLoadingRestaurantState extends RestaurantSectionHomeStates{}

class HomeSuccessRestaurantState extends RestaurantSectionHomeStates{}

class HomeErrorRestaurantState extends RestaurantSectionHomeStates {
  final String message;

  HomeErrorRestaurantState({
    required this.message,
  });
}


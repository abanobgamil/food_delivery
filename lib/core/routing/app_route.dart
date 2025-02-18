import 'package:food_delivery/core/routing/app_route_names.dart';
import 'package:food_delivery/features/app_layout/app_layout_screen.dart';
import 'package:food_delivery/features/login/presentaion/screens/login_screen.dart';
import 'package:food_delivery/features/restaurant_page/presentation/screens/restaurant_screen.dart';

class AppRoutes{
  static final routes = {
    AppRoutesNames.login: (context) => LoginScreen(),
    AppRoutesNames.appLayout: (context) => AppLayoutScreen(),
    AppRoutesNames.restaurantDetails: (context) => RestaurantScreen(),
  };
}
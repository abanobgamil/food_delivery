import 'package:flutter/material.dart';
import 'package:food_delivery/core/routing/app_route_names.dart';
import 'package:food_delivery/features/app_layout/app_layout_screen.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';
import 'package:food_delivery/features/login/presentaion/screens/login_screen.dart';
import 'package:food_delivery/features/product_details/presentation/screen/product_details_screen.dart';
import 'package:food_delivery/features/restaurant_page/data/models/products_model.dart';
import 'package:food_delivery/features/restaurant_page/presentation/screens/restaurant_screen.dart';

class AppRoutes{
  static final routes = {
    AppRoutesNames.login: (context) => LoginScreen(),
    AppRoutesNames.appLayout: (context) => AppLayoutScreen(),
    AppRoutesNames.restaurantDetails: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as RestaurantModel;
     return RestaurantScreen(restaurantData: args);
    },
    AppRoutesNames.productDetails: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as ProductsModel;
     return ProductDetailsScreen(productsModel: args);
    }
  };
}
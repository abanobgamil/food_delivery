import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/core/networking/firebase_instances.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';
import 'package:food_delivery/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo{

  @override
  Future<List<RestaurantModel>> getRestaurant() async {
    List<RestaurantModel> restaurantList = [];
    try {
      QuerySnapshot restaurantSnapshot = await FirebaseInstances.fireStore.collection('restaurants').get();
      for (var restaurantDoc in restaurantSnapshot.docs) {
       restaurantList.add(RestaurantModel.fromJson(restaurantDoc.data() as Map<String, dynamic>));
      }

      return restaurantList;
    } catch (e, stackTrace) {
      print('Error fetching data: $e'+"$stackTrace");
      return [];
    }
  }



}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/core/dependency_injection/setup_git.dart';
import 'package:food_delivery/features/restaurant_page/data/models/products_model.dart';
import 'package:food_delivery/features/restaurant_page/domain/repos/restaurant_repo.dart';

class RestaurantRepoIml extends RestaurantRepo {
  @override
  Future<List<ProductsModel>> getProducts(String restaurantId) async {
    List<ProductsModel> productsList = [];
    try {
      DocumentReference restaurantRef = getIt<FirebaseFirestore>()
          .collection('restaurants')
          .doc(restaurantId);
      QuerySnapshot productsSnapshot =
          await restaurantRef.collection('products').get();
      for (var doc in productsSnapshot.docs) {
        productsList.add(ProductsModel.fromJson(
            doc.data() as Map<String, dynamic>));
        print(doc.data());
      }

      return productsList;
    } catch (e, stackTrace) {
      print('Error fetching data: $e' + "$stackTrace");
      return [];
    }
  }
}

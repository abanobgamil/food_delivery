import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';
import 'package:food_delivery/features/restaurant_page/presentation/providers/restaurant_provider.dart';
import 'package:food_delivery/features/restaurant_page/presentation/widgets/products_shimmer_loading.dart';
import 'package:food_delivery/features/restaurant_page/presentation/widgets/restaurant_info.dart';
import 'package:food_delivery/features/restaurant_page/presentation/widgets/restaurant_image.dart';
import 'package:food_delivery/features/restaurant_page/presentation/widgets/restaurant_products.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({required this.restaurantData, super.key});

  final RestaurantModel restaurantData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantNotifierProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              RestaurantImage(image: restaurantData.restaurantImage),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: RestaurantInfo(
                  restaurantData: restaurantData,
                ),
              ),
            ]),
            Column(
              spacing: 15.h,
              children: [
                restaurantState.products.when(
                    data: (products) => RestaurantProducts(products: products),
                    error: (error, st) => Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextW400(text: 'Error loading products'),
                              SizedBox(height: 10.h),
                              CustomElevatedButton(
                                onPressed: () => ref
                                    .read(restaurantNotifierProvider.notifier)
                                    .getProducts(restaurantData.id),
                                text: 'Retry',
                              ),
                            ],
                          ),
                        ),
                    loading: () => ProductsShimmerLoading())
              ],
            ),
          ],
        ),
      ),
    );
  }
}

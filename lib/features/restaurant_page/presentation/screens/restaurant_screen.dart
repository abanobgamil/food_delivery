import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';
import 'package:food_delivery/features/home/presentation/providers/home_provider/home_provider.dart';
import 'package:food_delivery/features/restaurant_page/data/models/products_model.dart';
import 'package:food_delivery/features/restaurant_page/presentation/providers/restaurant_provider.dart';
import 'package:food_delivery/features/restaurant_page/presentation/widgets/restaurant_info.dart';
import 'package:food_delivery/features/restaurant_page/presentation/widgets/restaurant_image.dart';

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
            Stack(
              children: [
                RestaurantImage(image: restaurantData.restaurantImage),
                Padding(
                  padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      RestaurantInfo(restaurantData: restaurantData,),
                      restaurantState.products.when(data: (products)=> GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 8.w, // Spacing between columns
                          mainAxisSpacing: 8.h, // Spacing between rows
                        ),
                        itemCount: products.length, // Number of items
                        itemBuilder: (context, index) {
                          return Column(
                            spacing: 10.h,
                            children: [
                              Expanded(child: Image.network(products[index].image,)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  spacing: 10.h,
                                  children: [
                                    FittedBox(child: CustomTextW700(text: products[index].name)),
                                    CustomTextW700(text: products[index].price),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ), error: (error, st) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextW400(text: 'Error loading products'),
                            SizedBox(height: 10.h),
                            CustomElevatedButton(
                              onPressed: () => ref.read(restaurantNotifierProvider.notifier).getProducts(restaurantData.id),
                              text: 'Retry',
                            ),
                          ],
                        ),
                      ), loading: ()=> CircularProgressIndicator())
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

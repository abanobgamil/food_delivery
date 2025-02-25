import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';
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
              alignment: Alignment.bottomCenter,
              children: [
                RestaurantImage(image: restaurantData.restaurantImage),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: RestaurantInfo(restaurantData: restaurantData,),
                ),]),
                Column(
                  spacing: 15.h,
                  children: [
                    restaurantState.products.when(data: (products)=> LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
                        double childAspectRatio = (constraints.maxWidth / crossAxisCount) / 250;
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 15.h,
                            childAspectRatio: childAspectRatio
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return Column(
                              spacing: 10.h,
                              children: [
                                SizedBox(
                                  width: 150.h,
                                  height: 150.h,
                                  child: Expanded(
                                    child: Image.network(products[index].image,fit: BoxFit.fill,),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  spacing: 10.h,
                                  children: [
                                    CustomTextW700(text: products[index].name,fontSize: 10.sp,),
                                    CustomTextW700(text: '\$${products[index].price}',fontSize: 10.sp,),
                                  ],
                                )
                              ],
                            );
                          },
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
              ],
            ),
        ),
      );

  }
}

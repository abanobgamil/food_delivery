import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/home/presentation/providers/home_provider/home_provider.dart';
import 'package:food_delivery/features/home/presentation/widgets/offer_item.dart';
import 'package:food_delivery/features/home/presentation/widgets/restaurant_item.dart';
import 'package:food_delivery/features/home/presentation/widgets/shimmer_offer_list.dart';
import 'package:food_delivery/features/home/presentation/widgets/shimmer_restaurant_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextW700(text: "Check out our fancy restaurant"),
            SizedBox(
              height: 240.h,
              child: homeState.restaurants.when(
                data: (restaurantList) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final restaurant = restaurantList[index];
                    return RestaurantItem(
                      title: restaurant.restaurantName,
                      imageUrl: restaurant.restaurantImage,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemCount: restaurantList.length,
                ),
                loading: () => ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ShimmerRestaurantItem();
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemCount:3,
                ),
                error: (error, st) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextW400(text: 'Error loading restaurants'),
                      SizedBox(height: 10.h),
                      CustomElevatedButton(
                        onPressed: () => ref.read(homeNotifierProvider.notifier).getRestaurant(),
                        text: 'Retry',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomTextW700(text: "Offers"),
            const SizedBox(height: 20),
            homeState.offers.when(
              data: (offersList) => ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final offer = offersList[index];
                  return OfferItem(
                    title: offer.title,
                    imageUrl: offer.image,
                    description: offer.description,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: offersList.length,
              ),
              loading: () => ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const ShimmerOfferItem(),
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount: 2,
              ),
              error: (error, st) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error loading offers'),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () => ref.read(homeNotifierProvider.notifier).getOffers(),
                      child: Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

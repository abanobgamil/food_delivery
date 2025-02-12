import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_circular_progress_indicator.dart';
import 'package:food_delivery/features/home/presentation/providers/home_provider.dart';
import 'package:food_delivery/features/home/presentation/providers/home_states.dart';
import 'package:food_delivery/features/home/presentation/widgets/restaurant_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child){
      final homeState = ref.watch(homeNotifierProvider);
      final provider = ref.read(homeNotifierProvider.notifier);

      if (homeState is HomeLoadingRestaurantState) {
        return Center(child: CustomCircularProgressIndicator());
      }
      else if (homeState is HomeSuccessRestaurantState) {
        return Column(
          children: [
            SizedBox(
              height: 240.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16.r),
                itemBuilder: (BuildContext context, int index) {
                 return RestaurantItem(
                    title: provider.restaurantList[index].restaurantName ,
                    imageUrl: provider.restaurantList[index].restaurantImage,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                 return SizedBox(width: 10.w,);
                },
                itemCount: provider.restaurantList.length,
              ),
            )
          ],
        );
      }else{
        return const Center(child: Text('Error fetching data'));
      }
        }
  );
}}

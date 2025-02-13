import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_circular_progress_indicator.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/home/presentation/providers/restaurant_section_home_provider/restaurant_section_home_provider.dart';
import 'package:food_delivery/features/home/presentation/providers/restaurant_section_home_provider/restaurant_section_home_states.dart';
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
        return Center(child: CustomCircularProgressIndicator(color: AppColors.orange,width: 20.w,height: 20.w,));
      }
      else if (homeState is HomeSuccessRestaurantState) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.h,
            children: [
              CustomTextW700(text: "Check out our fancy restaurant"),
              SizedBox(
                height: 240.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
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
          ),
        );
      }else{
        return const Center(child: Text('Error fetching data'));
      }
        }
  );
}}

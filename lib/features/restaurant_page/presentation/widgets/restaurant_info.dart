import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/home/data/model/restaurant_model.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key, required this.restaurantData});

  final RestaurantModel restaurantData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextW700(text: restaurantData.restaurantName),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextW700(text: restaurantData.rating),
              Icon(
                Icons.star,
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5.w,
            children: [
              CustomTextW700(text: restaurantData.deliveryTime),
              Icon(
                Icons.access_time_sharp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

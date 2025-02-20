import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          border:
          Border.all(color: AppColors.black, width: 1.w),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextW700(text: "rest name"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextW700(text: "4.0"),
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
              CustomTextW700(text: "30-45 mins"),
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

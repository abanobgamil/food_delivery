import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: Image.network(
                imageUrl,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextW400(
                  text: title,
                  fontSize: 12.sp,
                ),
                SizedBox(height: 4.h),
                Text('Order now',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.darkRed,
                    )),
                SizedBox(height: 8.h),
                CustomElevatedButton(
                  backgroundColor: AppColors.lightRed,
                  onPressed: () {},
                  widget: FittedBox(
                    child: CustomTextW400(
                        text: 'View Menu', color: AppColors.black),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


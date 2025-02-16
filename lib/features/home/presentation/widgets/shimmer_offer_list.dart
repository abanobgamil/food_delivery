import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:food_delivery/core/theming/app_colors.dart';

class ShimmerOfferItem extends StatelessWidget {
  const ShimmerOfferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.r,
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Row(
          children: [
            // Left side: Title, description and button placeholders
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title placeholder
                    Container(
                      height: 20.h,
                      width: 100.w,
                      color: Colors.white,
                    ),
                    SizedBox(height: 4.h),
                    // Description placeholder
                    Container(
                      height: 14.h,
                      width: 150.w,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8.h),
                    // Button placeholder
                    Container(
                      height: 30.h,
                      width: 80.w,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            // Right side: Image placeholder
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(12.r),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

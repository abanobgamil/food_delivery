import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRestaurantItem extends StatelessWidget {
  const ShimmerRestaurantItem({super.key});

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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.r,
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            // Shimmer for the image part
            Expanded(
              child: ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            // Shimmer for the text/buttons part
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title shimmer
                  Container(
                    height: 12.sp,
                    width: 80.w,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4.h),
                  // "Order now" shimmer
                  Container(
                    height: 12.sp,
                    width: 40.w,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8.h),
                  // Button shimmer
                  Container(
                    height: 30.h,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

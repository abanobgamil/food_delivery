import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsShimmerLoading extends StatelessWidget {
  const ProductsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
        double childAspectRatio =
            (constraints.maxWidth / crossAxisCount) / 250;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: childAspectRatio,
          ),
          // Adjust itemCount as needed.
          itemCount: 8,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Placeholder for image
                  Container(
                    width: double.infinity,
                    height: 150.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10.h),
                  // Placeholder for title text
                  Container(
                    width: 100.w,
                    height: 10.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.h),
                  // Placeholder for price text
                  Container(
                    width: 50.w,
                    height: 10.h,
                    color: Colors.white,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

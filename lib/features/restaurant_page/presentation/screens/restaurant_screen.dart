import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/restaurant_page/presentation/restaurant_info.dart';
import 'package:food_delivery/features/restaurant_page/presentation/widgets/restaurant_image.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                RestaurantImage(image: ""),
                Padding(
                  padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
                  child: Column(
                    children: [
                      RestaurantInfo(),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 8.w, // Spacing between columns
                          mainAxisSpacing: 8.h, // Spacing between rows
                        ),
                        itemCount: 20, // Number of items
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.amber,
                            child: Center(
                              child: Text(
                                'Item $index',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network("",height: 100.h),
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        CustomTextW700(text: "rest name"),
                        Row(
                          children: [
                            Icon(Icons.star),
                            CustomTextW400(text: "4.0")
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

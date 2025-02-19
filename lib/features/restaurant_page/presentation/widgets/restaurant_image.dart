import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/splash_image.png",
      height: 200.h,
      width: double.infinity,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 200.h,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

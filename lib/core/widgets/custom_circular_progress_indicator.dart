import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key, this.color, this.height, this.width});

 final Color ? color;
 final double ? height;
 final double ? width;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary:color ?? AppColors.white,
        ),
      ),
      child: SizedBox(
          height: height ?? 13.h,
          width: width ?? 13.h,
          child:  CircularProgressIndicator.adaptive(strokeWidth: 2.w,)),
    );
  }
}

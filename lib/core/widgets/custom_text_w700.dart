import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';

class CustomTextW700 extends StatelessWidget {
  const CustomTextW700({
    super.key,
    required this.text,
    this.fontSize,
    this.color = AppColors.black,
    this.textDecoration,
    this.textDirection = TextDirection.rtl,
    this.textHeight,
  });

  final String? text;
  final double? fontSize;
  final double? textHeight;
  final Color color;
  final TextDecoration? textDecoration;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize ?? 13.sp,
        fontWeight: FontWeight.w700,
        color: color,
        decoration: textDecoration,
        height: textHeight,
        overflow: TextOverflow.ellipsis
      ),
      textDirection: textDirection,
      maxLines: 2,
    );
  }
}

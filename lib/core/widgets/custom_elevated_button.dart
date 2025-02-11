import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.widget,
    this.text = "",
    this.fontSize,
    this.height,
    this.width,
    this.minimumSize,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  final Widget? widget;
  final Function onPressed;
  final String text;
  final double? fontSize;
  final double? width;
  final double? height;
  final MaterialStateProperty<Size?>? minimumSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width == null ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
            minimumSize: minimumSize,
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(backgroundColor ?? AppColors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
               borderColor == null ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ): RoundedRectangleBorder(
                 side: BorderSide(
                   color: borderColor!,
                   width: 1.2.w
                 ),
                 borderRadius: BorderRadius.circular(5.r),
               ))),
        onPressed: () {
          onPressed();
        },
        child: widget ??
            CustomTextW700(
              text: text,
              color: textColor ?? AppColors.white,
              fontSize: fontSize ?? 13.sp,
            ),
      ),
    );
  }
}

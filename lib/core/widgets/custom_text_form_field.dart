import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    this.textDirection = TextDirection.rtl,
    // this.onSubmit,
    this.onChanged,
 //   this.onTap,
    this.validate,
    required this.hint,
    this.hintSize,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.inputAction,
    required this.type,
    this.isPasswordVisible = false,
    this.isClickable = true,
    this.readOnly = false,
    this.backgroundColor,
    this.hintColor,
    this.hasBorder = true,
    this.borderColor,
    this.contentPadding,
    this.isCollapsed,
  });

  final TextEditingController textController;
  final TextDirection textDirection;

  final TextInputType type;
  // final Function? onSubmit;
  final Function? onChanged;
 // final Function? onTap;
  final Function? validate;
  final String hint;
  final double ? hintSize;
  final IconData? prefix;
  final IconData? suffix;
  final bool isPasswordVisible;
  final bool hasBorder;
  final Color ? borderColor;

  final Function? suffixPressed;
  final bool isClickable;

  final bool readOnly;

  final TextInputAction? inputAction;

  final Color? backgroundColor;
  final Color? hintColor;

  final bool? isCollapsed;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:(String value) {
        if(onChanged != null){
          onChanged!();
        }
      },
      textDirection: textDirection,
      controller: textController,
      keyboardType: type,
      obscureText: isPasswordVisible,
      // onFieldSubmitted: (value) {
      //   onSubmit!(value);
      // },
      textInputAction: inputAction,
      validator: (value) {
        return validate!(value);
      },
      enabled: isClickable,
      readOnly: readOnly,
      cursorColor: AppColors.blue,
      cursorWidth: 1.5.w,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue, width: 2.w),borderRadius: BorderRadius.circular(7.r)
        ),
        enabledBorder: hasBorder == true
            ? OutlineInputBorder(borderSide: BorderSide(color: borderColor ?? AppColors.blue3, width: 1.w),borderRadius: BorderRadius.circular(7.r))
            : OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none),
        isCollapsed: isCollapsed,
        fillColor: backgroundColor ?? AppColors.blue2,
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(fontSize: hintSize ?? 12.sp, color: hintColor ?? AppColors.gray5,fontWeight: FontWeight.w400),
        errorStyle: TextStyle(fontSize: 12.sp),
        prefixIconConstraints: const BoxConstraints(minHeight: 0,minWidth: 0),
        prefixIcon: prefix != null
            ? Padding(
              padding: EdgeInsets.only(right: 10.w,left: 15.w),
              child: Icon(
                  prefix,
                  color: AppColors.gray4,
                  size: 20.sp,
                ),
            )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
                padding: EdgeInsets.only(left: 7.w),
                iconSize: 20.sp,
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                  color: AppColors.blue,
                ),
              )
            : null,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 14.sp,horizontal: 16.w),
      ),
    );
  }
}

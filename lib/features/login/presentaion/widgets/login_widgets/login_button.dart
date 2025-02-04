import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/login/presentaion/widgets/custom_elevated_button.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed:
      (){},
      widget: CustomTextW700(
        text: "login",
        color: AppColors.white,
        fontSize: 13.sp,
      ),
    );
  }

}

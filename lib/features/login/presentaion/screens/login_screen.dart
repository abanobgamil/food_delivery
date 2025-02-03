import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/login/presentaion/widgets/login_widgets/login_body.dart';
import 'package:food_delivery/features/login/presentaion/widgets/login_widgets/login_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 60.h,bottom: 40.h),
            //  color: AppColors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 10.h,
                children: [
                  CustomTextW700(text: "LogIn",fontSize: 18.sp,color: AppColors.black,),
                  LoginTitle(),
                  LoginBody(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

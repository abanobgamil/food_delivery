import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_button.dart';
import 'login_fields.dart';


class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 25.h),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginFields(),
            LoginButton(),
          ],
        ),
      ),
    );
  }
}

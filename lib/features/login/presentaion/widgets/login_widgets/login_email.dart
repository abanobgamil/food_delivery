import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15.h,
      children: [
        CustomTextW700(
          text: "Email",
          fontSize: 14.sp,
        ),
        CustomTextFormField(
          textController: TextEditingController(),
          validate: (value) {
             if(value.isEmpty){
               return "pleaseEnterEmailOrPhoneNumber";
             }
          },
          hint: "Email",
          type: TextInputType.emailAddress,
          hasBorder: false,
        ),
      ],
    );
  }
}

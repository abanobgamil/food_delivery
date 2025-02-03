import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';


class LoginPassword extends StatelessWidget {
  final double bottomPadding;
  const LoginPassword({super.key, this.bottomPadding=15});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.h,
        children: [
          CustomTextW700(
            text: "Password",
            fontSize: 14.sp,
          ),
          CustomTextFormField(
            textController: TextEditingController(),
            validate: (value) {
              if(value.isEmpty){
                return "pleaseEnterPassword";
              }
            },
            hint: "Password",
            type: TextInputType.visiblePassword,
            isPasswordVisible: false,
            suffix:  Icons.visibility_off,
            suffixPressed: (){},
          ),
        ],
      ),
    );
  }
}

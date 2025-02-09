import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/login/presentaion/providers/login_provider.dart';


class LoginPassword extends StatelessWidget {
  const LoginPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15.h,
      children: [
        CustomTextW700(
          text: "Password",
          fontSize: 14.sp,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return CustomTextFormField(
              textController: ref.read(loginNotifierProvider.notifier).passwordController,
              validate: (value) {
                if(value.isEmpty){
                  return "pleaseEnterPassword";
                }
              },
              hint: "Password",
              type: TextInputType.visiblePassword,
              isPasswordVisible: ref.read(passwordVisibleProvider.notifier).state,
              hasBorder: false,
              suffix: ref.watch(passwordVisibleProvider)
                  ? Icons.visibility_off
                  : Icons.visibility,
              suffixPressed: (){
                ref.read(loginNotifierProvider.notifier).changePasswordVisibility();
              },
            );
          },
        ),
      ],
    );
  }
}

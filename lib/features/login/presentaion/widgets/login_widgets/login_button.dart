import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_circular_progress_indicator.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/login/presentaion/providers/login_provider.dart';
import 'package:food_delivery/features/login/presentaion/providers/login_states.dart';
import 'package:food_delivery/features/login/presentaion/widgets/custom_elevated_button.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
    builder: (context,ref,child){
       final loginState = ref.watch(loginNotifierProvider);
       final provider = ref.read(loginNotifierProvider.notifier);
      return  CustomElevatedButton(
        height: 30.h,
          onPressed: (){
          if(provider.formKey.currentState!.validate())
            {
              provider.login();
            }
          },
          widget: loginState is LoginLoading ? CustomCircularProgressIndicator()
          : CustomTextW700(
            text: "LogIn",
            color: AppColors.white,
            fontSize: 13.sp,
          ),
          backgroundColor: AppColors.orange,
        );
      },

    );
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/features/login/presentaion/providers/login_provider.dart';
import 'package:food_delivery/features/login/presentaion/widgets/login_widgets/login_email.dart';
import 'package:food_delivery/features/login/presentaion/widgets/login_widgets/login_password.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Form(
          key: ref.read(loginNotifierProvider.notifier).formKey,
          child: Column(
            spacing: 20.h,
            children: [
              LoginEmail(),
              LoginPassword(),
            ],
          ),
        );
      },
    );
  }
}

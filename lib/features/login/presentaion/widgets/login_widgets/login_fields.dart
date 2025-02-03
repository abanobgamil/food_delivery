import 'package:flutter/material.dart';
import 'package:food_delivery/features/login/presentaion/widgets/login_widgets/login_email.dart';
import 'package:food_delivery/features/login/presentaion/widgets/login_widgets/login_password.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: ,
      child: const Column(
        children: [
          LoginEmail(),
          LoginPassword(),
        ],
      ),
    );
  }
}

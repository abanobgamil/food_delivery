import 'package:flutter/material.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/features/home/presentation/screen/home_screen.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.darkRed,),
      body: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key, required this.title, required this.description, required this.imageUrl,});

  final String title;
  final String description;
  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4)
        ],
      ),
      child: Row(
        children: [
          // Text and button content
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextW700(text: title),
                   SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      color: AppColors.darkRed,
                      fontSize: 14,
                    ),
                  ),
                   SizedBox(height: 8.h),
              CustomElevatedButton(
                backgroundColor: AppColors.lightRed,
                onPressed: () {},
                widget: FittedBox(
                  child: CustomTextW400(
                      text: 'Order now', color: AppColors.black),
                ),
              )],
              ),
            ),
          ),
          // Image section
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(12)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/theming/app_colors.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';
import 'package:food_delivery/core/widgets/custom_text_w400.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/restaurant_page/data/models/products_model.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productsModel});

  final ProductsModel productsModel ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20.h,
        children: [
          CachedNetworkImage(
            imageUrl: productsModel.image,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 200.h,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextW700(text: productsModel.name,fontSize: 14.sp,),
                CustomTextW400(text: productsModel.description,textAlign: TextAlign.left,fontSize: 12.sp,),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
            child: Row(
              spacing: 10.w,
              children: [
                Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CustomElevatedButton(onPressed: (){},backgroundColor: AppColors.orange,text: "Add To Cart",)),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                    CustomTextW700(text: "1"),
                    IconButton(onPressed: (){}, icon: Icon(Icons.add),color: AppColors.orange,),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

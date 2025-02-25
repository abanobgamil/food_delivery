import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/core/widgets/custom_text_w700.dart';
import 'package:food_delivery/features/restaurant_page/data/models/products_model.dart';

class RestaurantProducts extends StatelessWidget {
  const RestaurantProducts({super.key, required this.products});

  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context,
          BoxConstraints constraints) {
        int crossAxisCount =
        constraints.maxWidth > 600 ? 4 : 2;
        double childAspectRatio =
            (constraints.maxWidth / crossAxisCount) / 250;
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: childAspectRatio),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Column(
              spacing: 10.h,
              children: [
                SizedBox(
                  width: 150.h,
                  height: 150.h,
                  child: Expanded(
                    child: Image.network(
                      products[index].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  spacing: 10.h,
                  children: [
                    CustomTextW700(
                      text: products[index].name,
                      fontSize: 10.sp,
                    ),
                    CustomTextW700(
                      text: '\$${products[index].price}',
                      fontSize: 10.sp,
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }
}

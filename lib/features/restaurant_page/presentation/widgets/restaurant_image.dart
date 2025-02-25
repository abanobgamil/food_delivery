import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
   return CachedNetworkImage(
      imageUrl: image,
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
    );
  }
}

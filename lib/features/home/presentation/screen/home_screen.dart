import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery/features/home/presentation/providers/home_provider.dart';
import 'package:food_delivery/features/home/presentation/widgets/restaurant_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        //   return CustomTextFormField(textController: ref.read(homeNotifierProvider.notifier).searchController,
        //     hint: "search", type: TextInputType.text,prefix: Icons.search,);
        // },
        // ),
        RestaurantItem()
      ],
    );
  }
}

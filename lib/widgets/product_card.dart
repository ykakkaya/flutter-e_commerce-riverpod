// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/controller/product_list_controller.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/heading_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerWidget {
  int index;
  ProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(width: 250, height: 200, child: Image.asset(products[index].imgUrl)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  text: products[index].title,
                  color: AppColors.kBlackColor,
                  overflow:TextOverflow.ellipsis
                ),
                BodyText(
                  text: products[index].shortDescription,
                  color: AppColors.kBlackColor,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BodyText(
                      text: '\$${products[index].price.toString()}',
                      color: AppColors.kBlackColor,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          size: AppSizes.kIconSize,
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

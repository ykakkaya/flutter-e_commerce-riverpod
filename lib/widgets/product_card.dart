// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/controller/cart_list_controller.dart';
import 'package:ecommerce/controller/product_list_controller.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/heading_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends ConsumerWidget {
  int index;

  ProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
                width: 250,
                height: 200,
                child: Image.asset(
                  products[index].imgUrl,
                  fit: BoxFit.cover,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                    text: products[index].title,
                    color: AppColors.kBlackColor,
                    overflow: TextOverflow.ellipsis),
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
                        onPressed: () {
                          ref
                              .read(productNotifierProvider.notifier)
                              .isSelectedChange(products[index].pid, index);
                          if (products[index].isSelected == true) {
                            ref
                                .read(cartProductNotifier.notifier)
                                .removeCart(products[index].pid);
                          } else {
                            ref
                                .read(cartProductNotifier.notifier)
                                .addCart(products[index]);
                          }
                        },
                        icon: products[index].isSelected
                            ? Icon(
                                Icons.check_circle,
                                size: AppSizes.kIconSize,
                              )
                            : Icon(
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

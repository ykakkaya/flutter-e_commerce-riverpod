import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/constants/app_text.dart';
import 'package:ecommerce/controller/product_list_controller.dart';
import 'package:ecommerce/controller/product_qty_controller.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetails extends ConsumerWidget {
  int index;
  ProductDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productNotifierProvider);
    var productQuantity = ref.watch(productQuantityProvider);
    return Scaffold(
      appBar: CustomAppbar(appText: AppText.productDetailsAppbarText),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  product[index].imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadingText(text: product[index].title, color: AppColors.kBlackColor),
                  BodyText(text: product[index].longDescription, color: AppColors.kBlackColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingText(text: "\$${product[index].price.toString()}", color: AppColors.kPrimaryColor),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (productQuantity > 1) {
                                ref.read(productQuantityProvider.notifier).state--;
                              }
                            },
                            icon: const Icon(Icons.do_disturb_on_outlined),
                          ),
                          HeadingText(text: (productQuantity).toString(), color: AppColors.kPrimaryColor),
                          IconButton(
                              onPressed: () {
                                ref.read(productQuantityProvider.notifier).state++;
                              },
                              icon: const Icon(Icons.add_circle_outline))
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/constants/app_text.dart';
import 'package:ecommerce/controller/product_list_controller.dart';
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
                  HeadingText(
                      text: product[index].title,
                      color: AppColors.kPrimaryColor),
                  BodyText(
                      text: product[index].longDescription,
                      color: AppColors.kBlackColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingText(
                          text:
                              "Birim Fiyat : \$${product[index].price.toString()}",
                          color: AppColors.kPrimaryColor),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (product[index].qty > 1) {
                                ref
                                    .read(productNotifierProvider.notifier)
                                    .decreamentproductQty(product[index].pid);
                              }
                            },
                            icon: const Icon(Icons.do_disturb_on_outlined),
                          ),
                          HeadingText(
                              text: product[index].qty.toString(),
                              color: AppColors.kPrimaryColor),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(productNotifierProvider.notifier)
                                    .increamentproductQty(product[index].pid);
                              },
                              icon: const Icon(Icons.add_circle_outline))
                        ],
                      ),
                    ],
                  ),
                  BodyText(
                      text:
                          "Toplam Fiyat : \$ ${product[index].price * product[index].qty}",
                      color: AppColors.kBlackColor),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSizes.kButtonRadius))),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(AppSizes.kButtonPadding),
                        child: HeadingText(
                            text: AppText.addToCartButtonText,
                            color: AppColors.kWhiteColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

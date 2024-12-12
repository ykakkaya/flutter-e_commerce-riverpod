import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/constants/app_sizes.dart';
import 'package:ecommerce/constants/app_text.dart';
import 'package:ecommerce/controller/cart_list_controller.dart';
import 'package:ecommerce/controller/product_list_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/cart_list_widget.dart';
import 'package:ecommerce/widgets/coupon_widget.dart';
import 'package:ecommerce/widgets/custom_appbar.dart';
import 'package:ecommerce/widgets/heading_text.dart';
import 'package:ecommerce/widgets/sub_heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartProducts = ref.watch(cartProductNotifier);
    double totalPrice =
        ref.watch(cartProductNotifier.notifier).cartTotalPrice();
    return Scaffold(
      appBar: CustomAppbar(appText: AppText.cartViewAppbarText),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.kPadding),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: CartListWidget(cartProducts: cartProducts),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(AppSizes.kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SubHeadingText(
                        color: AppColors.kPrimaryColor, text: "Geçerli Kupon"),
                    const CouponWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SubHeadingText(
                                text: "Toplam", color: AppColors.kBlackColor),
                            const Spacer(),
                            SubHeadingText(
                                text: "\$${totalPrice.toString()}",
                                color: AppColors.kPrimaryColor),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

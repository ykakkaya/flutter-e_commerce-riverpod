import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/controller/cart_list_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/body_text.dart';
import 'package:ecommerce/widgets/heading_text.dart';
import 'package:ecommerce/widgets/sub_heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListWidget extends ConsumerWidget {
  const CartListWidget({
    super.key,
    required this.cartProducts,
  });

  final List<ProductModel> cartProducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Image.asset(cartProducts[index].imgUrl)),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeadingText(
                        text: cartProducts[index].title, color: Colors.black),
                    BodyText(
                        text: cartProducts[index].shortDescription,
                        color: Colors.black),
                    BodyText(
                        text: "\$${cartProducts[index].price.toString()}",
                        color: Colors.black),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (cartProducts[index].qty > 1) {
                          ref
                              .read(cartProductNotifier.notifier)
                              .decreamentproductQty(cartProducts[index].pid);
                        }
                      },
                      icon: const Icon(Icons.do_disturb_on_outlined),
                    ),
                    HeadingText(
                        text: cartProducts[index].qty.toString(),
                        color: AppColors.kPrimaryColor),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(cartProductNotifier.notifier)
                              .increamentproductQty(cartProducts[index].pid);
                        },
                        icon: const Icon(Icons.add_circle_outline))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
